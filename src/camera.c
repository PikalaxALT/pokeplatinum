#include <nitro.h>
#include <string.h>
#include <nnsys.h>

#include "data_02100844.h"

#include "overlay115/camera_angle.h"

#include "heap.h"
#include "unk_0201E190.h"
#include "camera.h"

#define CAMERA_DEFAULT_ASPECT_RATIO     (FX32_ONE * 4 / 3)
#define CAMERA_DEFAULT_NEAR_CLIP        (FX32_ONE * 150)
#define CAMERA_DEFAULT_FAR_CLIP         (FX32_ONE * 900)

GXBufferMode sBufferMode = GX_BUFFERMODE_W;

static Camera *sActiveCamera = NULL;

static void Camera_AdjustPositionAroundTarget(Camera *camera)
{
    u16 angleX = -camera->angle.x;
    camera->lookAt.position.x = FX_Mul(FX_Mul(FX_SinIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.position.z = FX_Mul(FX_Mul(FX_CosIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.position.y = FX_Mul(FX_SinIdx(angleX), camera->distance);

    VEC_Add(&camera->lookAt.position, &camera->lookAt.target, &camera->lookAt.position);
}

static void Camera_AdjustTargetFromAngle(Camera *camera)
{
    u16 angleX = -camera->angle.x;
    camera->lookAt.target.x = -FX_Mul(FX_Mul(FX_SinIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.target.z = -FX_Mul(FX_Mul(FX_CosIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.target.y = -FX_Mul(FX_SinIdx(angleX), camera->distance);

    VEC_Add(&camera->lookAt.target, &camera->lookAt.position, &camera->lookAt.target);
}

static void Camera_Init(const u16 fovY, Camera *camera)
{
    camera->fovY = fovY;
    camera->perspective.sinFovY = FX_SinIdx(fovY);
    camera->perspective.cosFovY = FX_CosIdx(fovY);
    camera->perspective.aspectRatio = CAMERA_DEFAULT_ASPECT_RATIO;
    camera->perspective.nearClip = CAMERA_DEFAULT_NEAR_CLIP;
    camera->perspective.farClip = CAMERA_DEFAULT_FAR_CLIP;
    camera->lookAt.up.x = 0;
    camera->lookAt.up.y = FX32_ONE;
    camera->lookAt.up.z = 0;
    camera->targetPos = NULL;
    camera->trackTargetX = FALSE;
    camera->trackTargetY = FALSE;
    camera->trackTargetZ = FALSE;
    camera->unk_64 = NULL;
}

static void Camera_AdjustDeltaPos(Camera const *camera, VecFx32 *deltaPos)
{
    if (camera->trackTargetX == FALSE) {
        deltaPos->x = 0;
    }

    if (camera->trackTargetY == FALSE) {
        deltaPos->y = 0;
    }

    if (camera->trackTargetZ == FALSE) {
        deltaPos->z = 0;
    }
}

static void sub_02020250 (Camera const * param0, const VecFx32 * param1, VecFx32 * param2)
{
    int * v0;
    int * v1;

    if (param0->unk_64 == NULL) {
        (*param2) = (*param1);
    } else {
        v0 = &param0->unk_64->unk_04;
        v1 = &param0->unk_64->unk_08;

        if (!param0->unk_64->unk_10) {
            (*param2) = (*param1);

            if (*v0 == param0->unk_64->unk_0C) {
                param0->unk_64->unk_10 = 1;
            }
        } else {
            (*param2) = param0->unk_64->unk_20[(*v0)];
        }

        (*v0) = ((*v0) + 1) % param0->unk_64->unk_00;
        param0->unk_64->unk_20[(*v1)] = (*param1);
        (*v1) = ((*v1) + 1) % param0->unk_64->unk_00;

        if (!param0->unk_64->unk_14) {
            param2->x = param1->x;
        }

        if (!param0->unk_64->unk_18) {
            param2->y = param1->y;
        }

        if (!param0->unk_64->unk_1C) {
            param2->z = param1->z;
        }
    }
}

void sub_02020304 (const int param0, const int param1, const int param2, const int param3, Camera * param4)
{
    int v0;
    UnkStruct_02020304 * v1;

    if (param4->targetPos == NULL) {
        return;
    }

    GF_ASSERT((param1 + 1 <= param0));

    v1 = Heap_AllocFromHeap(param3, sizeof(UnkStruct_02020304));
    v1->unk_20 = Heap_AllocFromHeap(param3, sizeof(VecFx32) * param0);

    for (v0 = 0; v0 < param0; v0++) {
        v1->unk_20[v0].x = 0;
        v1->unk_20[v0].y = 0;
        v1->unk_20[v0].z = 0;
    }

    v1->unk_00 = param0;
    v1->unk_04 = 0;
    v1->unk_08 = 0 + param1;
    v1->unk_0C = param1;
    v1->unk_10 = 0;
    v1->unk_14 = 0;
    v1->unk_18 = 0;
    v1->unk_1C = 0;

    if (param2 & 1) {
        v1->unk_14 = 1;
    }

    if (param2 & 2) {
        v1->unk_18 = 1;
    }

    if (param2 & 4) {
        v1->unk_1C = 1;
    }

    param4->unk_64 = v1;
}

void sub_02020390 (Camera * param0)
{
    if (param0->unk_64 != NULL) {
        Heap_FreeToHeap(param0->unk_64->unk_20);
        Heap_FreeToHeap(param0->unk_64);
        param0->unk_64 = NULL;
    }
}

Camera *Camera_Alloc(const enum HeapId heapID)
{
    return Heap_AllocFromHeap(heapID, sizeof(Camera));
}

void Camera_Delete(Camera *camera)
{
    Heap_FreeToHeap(camera);
}

void Camera_Copy(Camera const *src, Camera *dst)
{
    *dst = *src;
}

void Camera_SetAsActive(Camera *camera)
{
    sActiveCamera = camera;
}

void Camera_ClearActive(void)
{
    sActiveCamera = NULL;
}

void Camera_ComputeViewMatrix(void)
{
    if (sActiveCamera == NULL) {
        return;
    }

    if (sActiveCamera->targetPos != NULL) {
        VecFx32 targetPosDelta;
        VecFx32 v1;

        VEC_Subtract(sActiveCamera->targetPos, &sActiveCamera->prevTargetPos, &targetPosDelta);

        Camera_AdjustDeltaPos(sActiveCamera, &targetPosDelta);
        sub_02020250(sActiveCamera, &targetPosDelta, &v1);
        Camera_Move(&v1, sActiveCamera);

        sActiveCamera->prevTargetPos = *sActiveCamera->targetPos;
    }

    NNS_G3dGlbLookAt(&sActiveCamera->lookAt.position, &sActiveCamera->lookAt.up, &sActiveCamera->lookAt.target);
}

void sub_0202049C (void)
{
    if (sActiveCamera == NULL) {
        return;
    }

    if (sActiveCamera->targetPos != NULL) {
        VecFx32 v0;
        VecFx32 v1;

        VEC_Subtract(sActiveCamera->targetPos, &sActiveCamera->prevTargetPos, &v0);

        Camera_AdjustDeltaPos(sActiveCamera, &v0);
        sub_02020250(sActiveCamera, &v0, &v1);
        Camera_Move(&v1, sActiveCamera);

        sActiveCamera->prevTargetPos = *sActiveCamera->targetPos;

        {
            VecFx32 cameraPos = sActiveCamera->lookAt.position;
            VecFx32 cameraUp = sActiveCamera->lookAt.up;
            const VecFx32 * targetPos = sActiveCamera->targetPos;
            fx16 v5 = FX_CosIdx(sActiveCamera->angle.x);
            fx16 v6 = FX_SinIdx(sActiveCamera->angle.y);
            fx16 v7 = FX_CosIdx(sActiveCamera->angle.y);
            fx16 v8 = FX_SinIdx(sActiveCamera->angle.z);
            fx16 v9 = FX_CosIdx(sActiveCamera->angle.z);

            cameraPos.z = FX_Mul(v7, sActiveCamera->distance);
            cameraPos.z = FX_Mul(cameraPos.z, v5);
            cameraPos.z += targetPos->z;
            cameraUp.x += FX_Mul(v8, v7);
            cameraUp.y += v9;
            cameraUp.z += -FX_Mul(v8, v6);

            NNS_G3dGlbLookAt(&cameraPos, &cameraUp, targetPos);
        }
    } else {
        NNS_G3dGlbLookAt(&sActiveCamera->lookAt.position, &sActiveCamera->lookAt.up, &sActiveCamera->lookAt.target);
    }
}

void Camera_SetUp(const VecFx32 *up, Camera *camera)
{
    camera->lookAt.up = *up;
}

void Camera_TrackTarget(const VecFx32 *target, Camera *camera)
{
    camera->targetPos = target;
    camera->prevTargetPos = *target;
    camera->trackTargetX = TRUE;
    camera->trackTargetY = TRUE;
    camera->trackTargetZ = TRUE;
}

void Camera_ReleaseTarget(Camera *camera)
{
    camera->targetPos = NULL;
    camera->trackTargetX = FALSE;
    camera->trackTargetY = FALSE;
    camera->trackTargetZ = FALSE;
}

void Camera_SetClipping(const fx32 nearClip, const fx32 farClip, Camera *camera)
{
    camera->perspective.nearClip = nearClip;
    camera->perspective.farClip = farClip;

    Camera_ComputeProjectionMatrix(camera->projection, camera);
}

void Camera_InitWithTarget(const VecFx32 *target, const fx32 distance, const CameraAngle *angle, const u16 fovY, const u8 projection, const BOOL trackTarget, Camera *camera)
{
    Camera_Init(fovY, camera);

    camera->lookAt.target = *target;
    camera->distance = distance;
    camera->angle = *angle;

    Camera_AdjustPositionAroundTarget(camera);
    Camera_ComputeProjectionMatrix(projection, camera);

    if (trackTarget) {
        camera->targetPos = target;
        camera->prevTargetPos = *target;
        camera->trackTargetX = TRUE;
        camera->trackTargetY = TRUE;
        camera->trackTargetZ = TRUE;
    }
}

void Camera_InitWithPosition(const VecFx32 *position, const fx32 distance, const CameraAngle *angle, const u16 fovY, const u8 projection, Camera *camera)
{
    Camera_Init(fovY, camera);

    camera->lookAt.position = *position;
    camera->distance = distance;
    camera->angle = *angle;

    Camera_AdjustTargetFromAngle(camera);
    Camera_ComputeProjectionMatrix(projection, camera);
}

void Camera_InitWithTargetAndPosition(const VecFx32 *target, const VecFx32 *position, const u16 fovY, const u8 projection, const BOOL trackTarget, Camera *camera)
{
    VecFx32 distanceVector;

    Camera_Init(fovY, camera);

    camera->lookAt.target = *target;
    camera->lookAt.position = *position;
    VEC_Subtract(position, target, &distanceVector);
    camera->distance = VEC_Mag(&distanceVector);

    {
        // ROM doesn't match without these
        VecFx32 unused0 = {0, 0, 0};
        VecFx32 unused1 = {0, 0, 0};
        VecFx32 v = {0, 0, 0};
        VecFx32 unit;

        unit.x = 0;
        unit.y = 0;
        unit.z = FX32_ONE;

        v = distanceVector;
        v.y = 0;

        camera->angle.y = VEC_AngleBetween(&unit, &v);

        unit.x = FX32_ONE;
        unit.y = 0;
        unit.z = 0;

        v.x = distanceVector.z;
        v.z = distanceVector.y;
        v.y = 0;

        camera->angle.x = VEC_AngleBetween(&unit, &v);
        camera->angle.z = 0;
    }

    Camera_ComputeProjectionMatrix(projection, camera);

    if (trackTarget) {
        camera->targetPos = target;
        camera->prevTargetPos = *target;
        camera->trackTargetX = TRUE;
        camera->trackTargetY = TRUE;
        camera->trackTargetZ = TRUE;
    }
}

void Camera_ComputeProjectionMatrix(const u8 projection, Camera *camera)
{
    if (projection == CAMERA_PROJECTION_PERSPECTIVE) {
        NNS_G3dGlbPerspective(
            camera->perspective.sinFovY, 
            camera->perspective.cosFovY, 
            camera->perspective.aspectRatio, 
            camera->perspective.nearClip, 
            camera->perspective.farClip
        );

        camera->projection = CAMERA_PROJECTION_PERSPECTIVE;
        sBufferMode = GX_BUFFERMODE_Z;
    } else {
        fx32 top = FX_Mul(FX_Div(camera->perspective.sinFovY, camera->perspective.cosFovY), camera->distance);
        fx32 right = FX_Mul(top, camera->perspective.aspectRatio);

        NNS_G3dGlbOrtho(top, -top, -right, right, camera->perspective.nearClip, camera->perspective.farClip);

        camera->projection = CAMERA_PROJECTION_ORTHOGRAPHIC;
        sBufferMode = GX_BUFFERMODE_Z;
    }
}

void Camera_SetFOV(const u16 fovY, Camera *camera)
{
    camera->fovY = fovY;
    camera->perspective.sinFovY = FX_SinIdx(camera->fovY);
    camera->perspective.cosFovY = FX_CosIdx(camera->fovY);

    Camera_ComputeProjectionMatrix(camera->projection, camera);
}

void Camera_AdjustFOV(const u16 amount, Camera *camera)
{
    camera->fovY += amount;
    camera->perspective.sinFovY = FX_SinIdx(camera->fovY);
    camera->perspective.cosFovY = FX_CosIdx(camera->fovY);

    Camera_ComputeProjectionMatrix(camera->projection, camera);
}

void Camera_Move(const VecFx32 *delta, Camera *camera)
{
    VEC_Add(&camera->lookAt.position, delta, &camera->lookAt.position);
    VEC_Add(&camera->lookAt.target, delta, &camera->lookAt.target);
}

void Camera_SetAngleAroundSelf(const CameraAngle *angle, Camera *camera)
{
    camera->angle = *angle;
    Camera_AdjustTargetFromAngle(camera);
}

void Camera_SetAngleAroundTarget(const CameraAngle *angle, Camera *camera)
{
    camera->angle = *angle;
    Camera_AdjustPositionAroundTarget(camera);
}

void Camera_AdjustAngleAroundSelf(const CameraAngle *amount, Camera *camera)
{
    camera->angle.x += amount->x;
    camera->angle.y += amount->y;
    camera->angle.z += amount->z;

    Camera_AdjustTargetFromAngle(camera);
}

void Camera_AdjustAngleAroundTarget(const CameraAngle *amount, Camera *camera)
{
    camera->angle.x += amount->x;
    camera->angle.y += amount->y;
    camera->angle.z += amount->z;

    Camera_AdjustPositionAroundTarget(camera);
}

void Camera_SetDistance(const fx32 distance, Camera *camera)
{
    camera->distance = distance;
    Camera_AdjustPositionAroundTarget(camera);
}

void Camera_SetTargetAndUpdatePosition(const VecFx32 *target, Camera *camera)
{
    camera->lookAt.target = *target;
    Camera_AdjustPositionAroundTarget(camera);
}

void Camera_AdjustDistance(const fx32 amount, Camera *camera)
{
    camera->distance += amount;
    Camera_AdjustPositionAroundTarget(camera);
}

u16 Camera_GetFOV(Camera const *camera)
{
    return camera->fovY;
}

fx32 Camera_GetDistance(Camera const *camera)
{
    return camera->distance;
}

CameraAngle Camera_GetAngle(Camera const *camera)
{
    return camera->angle;
}

VecFx32 Camera_GetTarget(Camera const *camera)
{
    return camera->lookAt.target;
}

VecFx32 Camera_GetPosition(Camera const *camera)
{
    return camera->lookAt.position;
}

void Camera_SetTarget(const VecFx32 *target, Camera *camera)
{
    camera->lookAt.target = *target;
}

void Camera_SetPosition(const VecFx32 *position, Camera *camera)
{
    camera->lookAt.position = *position;
}
