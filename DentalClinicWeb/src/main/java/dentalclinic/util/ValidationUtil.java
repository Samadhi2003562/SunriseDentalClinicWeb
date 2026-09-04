package dentalclinic.util;

public class ValidationUtil {
    
    public static boolean isValidName(String name) {
        return name != null && !name.trim().isEmpty() && name.matches("[a-zA-Z\\s]+");
    }

    public static boolean isValidPhoneNumber(String phone) {
        return phone != null && phone.matches("\\d{10,15}");
    }

    public static boolean isValidDate(String date) {
        return date != null && date.matches("\\d{4}-\\d{2}-\\d{2}");
    }

    public static boolean isValidTime(String time) {
        return time != null && time.matches("([01]?[0-9]|2[0-3]):[0-5][0-9]");
    }

    public static boolean isValidAppointmentNumber(String number) {
        return number != null && number.matches("APT-[A-Z0-9]{8}");
    }

    public static boolean isValidUsername(String username) {
        return username != null && !username.trim().isEmpty() && username.length() >= 3;
    }

    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }
}