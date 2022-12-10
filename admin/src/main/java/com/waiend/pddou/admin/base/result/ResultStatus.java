package com.waiend.pddou.admin.base.result;

/**
 * @author end
 * @date 2022年12月09日 22:28
 */
public enum ResultStatus {

    SUCCESS(20000), // 成功

    FAIL(40000), // 失败

    BAD_REQUEST(400), // 错误请求

    UNAUTHENTICATED(401), // 未认证

    UNAUTHORIZED(403), // 未授权

    NOT_FOUND(404), // 未找到

    METHOD_NOT_ALLOWED(405), // 方法不允许

    INTERNAL_SERVER_ERROR(500), // 网络错误

    INVALID_TOKEN(101), // 令牌错误

    KICKED(103), // 被踢出

    PERMISSION_CHANGE(104), // 权限发生变动

    BAD_GATEWAY(105); // 网关错误

    private final int status;

    ResultStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return this.status;
    }
}
