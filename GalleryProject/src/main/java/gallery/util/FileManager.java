package gallery.util;

public class FileManager {
    
    public static String getExt(String path) {
        int index = path.lastIndexOf(".");//제일마지막점의 인덱스
        return path.substring(index+1,path.length());
    }
    
    
    public static void main(String[] args) {
        System.out.println(getExt("test.babo.aa.jpg"));
    }
}