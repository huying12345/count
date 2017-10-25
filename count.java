package com.io;
//import java.io.*代替
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

//类count名必须与该文件名一致
public class count {
 //写入文件的方法 
 public static void write2File(String filename, long count){ 
  try{
//PrintWriter用法 可以参考网页 http://www.cnblogs.com/xiaotiaosi/p/6394147.html
   PrintWriter out = new PrintWriter(new FileWriter(filename)); 
   out.println(count); 
   out.close(); 
  } catch (IOException e) { 
   //捕捉异常信息
   e.printStackTrace(); 
  } 
 } 
   
 //读取文件的方法 readFromFile
 public static long readFromFile(String filename){ 
  File file = new File(filename); 
  long count = 0;  //long 长整型
  if(!file.exists()){ 
   try { 
    file.createNewFile(); 
   } catch (IOException e) { 
    //捕捉异常
    e.printStackTrace(); 
   }
   //文件不存在的情况，新建文件并初始化内容count为0;
   write2File(filename, 0); 
  } 
  try{
    //BufferedReader包装类，将字符流放入缓存里，先把字符读到缓存里，到缓存满了或flush的时候，再读入缓存，提高读的效率
     BufferedReader in = new BufferedReader(new FileReader(file));
   try{
    //此方法返回的十进制参数表示的count
     count = Long.parseLong(in.readLine());
   } 
   catch (NumberFormatException e) {
    // TODO: handle exception
    e.printStackTrace(); 
   } catch (IOException e) { 
    // TODO Auto-generated catch block 
    e.printStackTrace(); 
   } 
  } catch (FileNotFoundException e) { 
   // TODO: handle exception 
   e.printStackTrace(); 
  }
//读取文本最后返回count值
  return count; 
 } 
}