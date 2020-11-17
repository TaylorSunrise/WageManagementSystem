package com.love.meat.util;

import com.love.meat.entity.Day;
import org.springframework.util.DigestUtils;

import java.lang.reflect.Field;
import java.util.function.Function;

/**
 * @author Taylor
 * @time 2020-07-24
 */
public class Utils {

    public static final String wageName[]={"计时","计件","周结","月结"};
    public static final String wageType[]={"小时","件","天","天"};

    public static final String type[][] = {
            {"姓名","工资构成","月份","时间","工资","操作"},
            {"姓名","工资构成","月份","件数","工资","操作"},
            {"姓名","工资构成","月份","天数","工资","操作"},
            {"姓名","工资构成","月份","天数","工资","操作"}
    };

    public static String StringToMD5(String str){
        return DigestUtils.md5DigestAsHex(str.getBytes());
    }

    /**
     * 拆分考勤表
     * 第几天，【是否打卡/计件数量/计时小时数】-下一天，【是否打卡/计件数量/计时小时数】
     * @return
     */
    public static String[] splitCheck(String check, Function<String,String> str){
        String[] result = new String[31];
        String[] split = check.split("-");
        for (String s : split) {
            String[] split1 = s.split(",");
            split1[1] = str.apply(split1[1]);
            result[Integer.parseInt(split1[0]) - 1] = split1[1];
        }
        return result;
    }

    public static Function<String,String> getCheckMethod(int type){
        switch (type){
            case 1:
            case 2: return x -> x == null ? "" : x;
            case 3:
            case 4: return x -> x != null ? Integer.parseInt(x) != 0 ? "√" : "×" : "";
            default: return x -> x;
        }
    }

    public static Day valueToObject(Day day,String check,Function<String,String> str){
        String[] result = splitCheck(check,str);
        Class<Day> dayClass = Day.class;
        int total = 0;
        for (int i = 0; i < result.length; i++) {
            if(result[i] != null){
                if(result[i].equals("√"))
                    total += 1;
                else if(!result[i].equals("×"))
                    total += Integer.parseInt(result[i]);
                try {
                    Field declaredField = dayClass.getDeclaredField("day" + (i + 1));
                    declaredField.setAccessible(true);
                    declaredField.set(day,result[i]);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        day.setTotal("" + total);
        return day;
    }

    public static Integer getTotal(String check,Function<String,Integer> str){
        int total = 0;
        String[] split = check.split("-");
        for (String s : split) {
            String[] split1 = s.split(",");
            total += str.apply(split1[1]);
        }
        return total;
    }

    public static Function<String,Integer> getCount(int type){
        switch (type){
            case 1:
            case 2: return x -> x == null ? 0 : Integer.parseInt(x);
            case 3:
            case 4: return x -> x != null ? Integer.parseInt(x) != 0 ? 1 : 0 : 0;
            default: return x -> Integer.parseInt(x);
        }
    }
}
