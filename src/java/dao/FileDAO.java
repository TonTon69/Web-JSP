package dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model.Question;
//import model.ObjExcel;

public class FileDAO {

    String text;

    public FileDAO(String text) {
        super();
        this.text = text;
    }

    public String getStringArray() {
        String res = "";
        String[] str = this.text.split("[\n]");
        for (String string : str) {
            res += string.trim();
        }

        String sf = "";
        int batDau = 0;
        int ketThuc = 0;
        for (int i = 0; i < res.length(); i++) {
            if (res.charAt(i) != ' ') {
                sf += res.charAt(i) + "";
            }
        }
        for (int i = 0; i < sf.length(); i++) {
            if (sf.charAt(i) == '[') {
                batDau = i;
                break;
            }
        }
        for (int i = 0; i < sf.length(); i++) {
            if (sf.charAt(i) == ']') {
                ketThuc = i;
                break;
            }
        }
        res = sf.substring(batDau, ketThuc);
        res = res.substring(1, res.length());

        return res;
    }

    public Map<String, Question> getQuestion(String s) {
        ArrayList<String> listBig = new ArrayList<>();
        ArrayList<String> list = new ArrayList<>();
        Map<String, Question> mapOBJ = new HashMap<String, Question>();
        //lấy ra từng hàng của file excel
        s = s.substring(1, s.length() - 1);
        String[] arr = s.split("}");
        for (int i = 0; i < arr.length; i++) {
            if (i == 0) {
                arr[i] = arr[i].substring(0, arr[i].length());
            } else {
                arr[i] = arr[i].substring(2, arr[i].length());
            }
            listBig.add(arr[i]);
        }
        //Kiểm tra xem danh sách nhận từ excel có hợp lệ hay không,nếu có thì import,ngược lại là return null
        if (listBig.size() < 15 || listBig.size() > 15) {
            return null;
        } else {
            //Lấy ra từng giá trị của hàng,tạo ra object tương ứng,truyền giá trị của hàng vào thuộc tính
            for (int j = 0; j < listBig.size(); j++) {
                list = getStringDoubleDot(listBig.get(j));
                mapOBJ.put(list.get(0), new Question(Integer.parseInt(list.get(0)), Integer.parseInt(list.get(1)), Integer.parseInt(list.get(2)), list.get(3), list.get(4), list.get(5), list.get(6), list.get(7), list.get(8), Integer.parseInt(list.get(9)), list.get(10), list.get(11), new Timestamp(System.currentTimeMillis())));
            }
        }
        return mapOBJ;
    }


    public ArrayList<String> getStringDoubleDot(String s) {
        ArrayList<String> list = new ArrayList<>();
        String[] arr = s.split(",");
        for (int i = 0; i < arr.length; i++) {
            list.add(arr[i].split(":")[1]);
        }
        return list;
    }
    
}
