package kr.kh.app.utils;

public class NullCheck {

    public boolean nullCheck(Object... parameters) {
        for (Object param : parameters) {
            if (param == null) {
                return false;
            }
        }
        return true;
    }

}
