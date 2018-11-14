package com.Beillam.action;

public class ActionForward {
private String path; // View Page (결과값을 전송할 곳)

// 페이지 이동하는 방법 (sendRedirect, forward)
private boolean isRedirect; // true: sendRedirect, false: forward

public String getPath() {
return path;
}

public void setPath(String path) {
this.path = path;
}

public boolean isRedirect() {
return isRedirect;
}

public void setRedirect(boolean isRedirect) {
this.isRedirect = isRedirect;
}

}