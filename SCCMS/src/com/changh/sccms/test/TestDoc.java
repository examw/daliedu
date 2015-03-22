package com.changh.sccms.test;

import java.io.File;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

  

public class TestDoc {  

  

    /** 

     * @param args 

     */  

    public static void main(String[] args) {          

        exportExcel("D:\\text.xls");  

    }  

  

public static void exportExcel(String fileName){  

        try{  

            WritableWorkbook book = Workbook.createWorkbook(new File(fileName));  

            WritableSheet sheet = book.createSheet("学习卡列表", 0);  

            // 设置各列宽度  

            sheet.setColumnView(0, 10);  //编号

            sheet.setColumnView(1, 20);  //卡号

            sheet.setColumnView(2, 15);  //密码

            sheet.setColumnView(3, 25);  //生成时间

            sheet.setColumnView(4, 25);  //过期时间

            sheet.setColumnView(5, 15);  //面值

            sheet.setColumnView(6, 15);  //是否赠送

            sheet.setColumnView(7, 15);  

            sheet.setColumnView(8, 20);  

            sheet.setColumnView(9, 20);  

            sheet.setColumnView(10, 10);  

              

            // 设置行高  

            sheet.setRowView(0, 500);  

            sheet.setRowView(1, 500);  

              

            // 第一行  

            sheet.mergeCells(0, 0, 10, 0);  

            Label label = new Label(0,0,"测试JXL操作Excel表格");  

            label.setCellFormat(ExcelStyleUtils.titleCellFormat(null, false, 16));  

            sheet.addCell(label);  

              

            // 第二行  

            sheet.mergeCells(0, 1, 10, 1);  

            Label line2 = new Label(0,1,"2011年4月28日");  

            line2.setCellFormat(ExcelStyleUtils.titleCellFormat(Alignment.RIGHT, false, 14));  

            sheet.addCell(line2);  

              

            // 第三行  

            sheet.addCell(new Label(0, 2, "姓名", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(1, 2, "性别", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(2, 2, "出生年月", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(3, 2, "参加工作时间", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(4, 2, "毕业时间", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(5, 2, "毕业院 校及专业", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(6, 2, "专业职称", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(7, 2, "工作职称", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(8, 2, "工作职务", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(9, 2, "特长", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(10, 2, "备注", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

              

            // 循环输出内容  

            int line = 3;  

            int counts = 0;  

            for(int i = 1 ; i <= 15 ; i++){  

                sheet.mergeCells(0, line, 10, line);  

                sheet.addCell(new Label(0, line, ++counts + "、" + "开发部门_" + i, ExcelStyleUtils.titleCellFormat(Alignment.LEFT, true, 12)));  

                line++;  

                for(int j = 0 ; j < 3 ; j++){  

                    sheet.addCell(new Label(0, line, "开发_" + j, ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    String sex = "男";  

                    if(j == 2 || i % 2 == 0){  

                        sex = "女";  

                    }  

                    sheet.addCell(new Label(1, line, sex, ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(2, line, 1980+i-j+"年" + (3+ j) +"月"+(i + j)+"日", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(3, line, 2000+i-j+"年" + (3+ j) +"月"+(i + j)+"日", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(4, line, 1996+i-j+"年7月1日", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(5, line, "大学本科", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(6, line, "java开发工程师", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(7, line, "Java研发", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(8, line, "各种PM", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(9, line, "Java、J2EE、SQL、SSH、JBPM", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(10, line, "各种技术牛人", ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    line++;  

                }  

            }  

              

            book.write();  

            book.close();  

        }catch(Exception e){  

            e.printStackTrace();  

        }  

    }  

  

}          