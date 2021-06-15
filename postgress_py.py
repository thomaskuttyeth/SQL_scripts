


import psycopg2

import psycopg2.extras  
con = psycopg2.connect(dbname = 'dvdrental', user = 'postgres', password = 'supinf123', host = 'localhost') 
cur = con.cursor()  

# cur.execute('CREATE TABLE student(id serial primary key, name varchar);') 

# cur.execute('select * from customer;') 
# result = cur.fetchone()
# print(result[0])


# getting all the table names in a data base 
cur.execute("""
SELECT table_name FROM information_schema.tables
       WHERE table_schema = 'public'
       """)
for table in cur.fetchall():
    print(table[0])

# con.commit()

print('----------------------------------')



# getting the colum names of a table 
cur.execute("""
        select * from information_schema.columns
        where table_schema = 'public'
        and table_name = 'customer'
""")
for  i in cur.fetchall():
    print(i[3])

cur.close() 
con.close()
