# -*- coding: utf-8 -*-
"""
Created on Sat Jan 25 18:24:12 2020

@author: winst
"""

import psycopg2

daysList=["MON","TUE","WED","THU","FRI"]
conn=psycopg2.connect(
    database="timeTableGeneration",
    user="postgres",
    password="qwerty12345",
    host="localhost",
    port="5432"
    )
conn.autocommit = True
print("connected to postgres")


class Theory():
    def __init__(self,subid,day,hour,lecName):
        self.subid=subid
        self.day=day
        self.hour=hour
        self.lecName=lecName
        
        
    def __str__(self):
        retStr="subject id:"+str(self.subid)+"\nDay:"+str(self.day)+"\nHour:"+str(self.hour)+"\nLecturer Name:"+str(self.lecName)
        return retStr

def resetCounters():
    cur=conn.cursor()
    cur.execute("SELECT SETVAL((SELECT pg_get_serial_sequence('class_time_table', 'ctt_id')), 1, false)")
    
    cur.close()

def resetTables():
    cur=conn.cursor()
    cur.execute("delete from staffdetails_ctt")
    cur.execute("delete from subjects_ctt")
    cur.execute("delete from subjects_stt")
    cur.execute("delete from class_time_table")
    cur.execute("delete from staff_time_table")
    cur.close()
    resetCounters()
    

def addInputNoStaff(sub_id,day,period,class_id):
    cur=conn.cursor()
    #class_time_table
    #ctt_id,staff_id,sub_id,day,period,class_id
    cur.execute("insert into class_time_table (sub_id,day,period,class_id) values ('"+str(sub_id)+"','"+str(day)+"',"+str(period)+",'"+str(class_id)+"') ")
    cur.execute("select ctt_id from class_time_table where sub_id='"+str(sub_id)+"' and day='"+str(day)+"' and period="+str(period)+" and class_id='"+str(class_id)+"'")
    ctt_id=cur.fetchall()[0][0]
    cur.execute("insert into subjects_ctt values('"+str(sub_id)+"',"+str(ctt_id)+")")
    
    cur.close()


def addInputWithStaff(staff_id,sub_id,day,period,class_id):
    cur=conn.cursor()
    cur.execute("insert into class_time_table (staff_id,sub_id,day,period,class_id) values ('"+str(staff_id)+"','"+str(sub_id)+"','"+str(day)+"',"+str(period)+",'"+str(class_id)+"') ")
    cur.execute("select ctt_id from class_time_table where staff_id='"+str(staff_id)+"' and sub_id='"+str(sub_id)+"' and day='"+str(day)+"' and period="+str(period)+" and class_id='"+str(class_id)+"'")
    ctt_id=cur.fetchall()[0][0]
    cur.execute("insert into subjects_ctt values("+str(sub_id)+"','"+str(ctt_id)+"')")
    cur.execute("insert into staff_time_table (staff_id,sub_id,day,period,class_id) values ('"+str(staff_id)+"','"+str(sub_id)+"','"+str(day)+"',"+str(period)+",'"+str(class_id)+"') ")    
    cur.execute("select stt_id from staff_time_table where staff_id='"+str(staff_id)+"' and sub_id='"+str(sub_id)+"' and day='"+str(day)+"' and period="+str(period)+" and class_id='"+str(class_id)+"'")
    stt_id=cur.fetchall()[0][0]
    cur.execute("insert into subjects_stt values("+str(sub_id)+"','"+str(stt_id)+"')")
    cur.execute("insert into staffdetails_ctt values("+str(staff_id)+"','"+str(ctt_id)+"')")
    
    cur.close()
    
def getClassTimeTable(class_id):
    print(class_id)
    cur=conn.cursor()
    print("   \t1    \t2    \t3    \t4    \t5    \t6    \t7")
    for day in daysList:
        print(day+"\t",end="")
        for period in range(1,8):
            cur.execute("select sub_id from class_time_table where class_id='"+class_id+"' and day='"+day+"' and period="+str(period))            
            try:                                        #if cur is empty, then fetching will throw an error
                print(cur.fetchone()[0]+"\t",end="")
            except:
                print("NULL\t",end="")
        print()
    print("-----------------------------------------------------------")
    cur.close()
resetTables()

addInputNoStaff("MAT-III", "MON", 1, "3A")
addInputNoStaff("KAN", "MON", 6, "3A")
addInputNoStaff("MAT-III", "TUE", 4, "3A")
addInputNoStaff("V-ACT", "WED", 6, "3A")
addInputNoStaff("V-ACT", "WED", 7, "3A")
addInputNoStaff("MAT-III", "THU", 2, "3A")
addInputNoStaff("MAT-III", "FRI", 5, "3A")

addInputNoStaff("KAN", "MON", 7, "3B")
addInputNoStaff("MAT-III", "TUE", 5, "3B")
addInputNoStaff("MAT-III", "WED", 1, "3B")
addInputNoStaff("V-ACT", "WED", 3, "3B")
addInputNoStaff("V-ACT", "WED", 4, "3B")
addInputNoStaff("MAT-III", "THU", 3, "3B")
addInputNoStaff("KAN", "THU", 7, "3B")
addInputNoStaff("MAT-III", "FRI", 2, "3B")

getClassTimeTable("3A")
getClassTimeTable("3B")

resetTables()