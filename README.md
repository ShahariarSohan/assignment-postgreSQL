### PostgreSQL কি?

PostgreSQL হলো বিশ্বের সবচেয়ে উন্নত ডাটাবেজ সিস্টেম। এটি একটি ওপেন সোর্স ডাটাবেজ সিস্টেম, যেটি যে কেউ ব্যবহার করতে পারে। PostgreSQL-এর সুবিধাজনক ব্যবহারের জন্য এটি বিশ্বের অন্যান্য যেকোনো রিলেশনাল ডাটাবেজ সিস্টেমের চেয়ে বেশি জনপ্রিয়। এটি ডেটা সংরক্ষণ করে, কাস্টমাইজ করে এবং ডাটাবেজ থেকে ডেটা সংগ্রহ করে। এটি মূলত SQL কমান্ডের মাধ্যমে কাজ করে, যেমন SELECT, UPDATE, DELETE, ALTER ইত্যাদি।
বর্তমানে ডাটাবেজ ব্যবহারের গুরুত্ব দিন দিন বৃদ্ধি পাচ্ছে এবং সেই সাথে PostgreSQL-এর ব্যবহারও প্রতিনিয়ত বাড়ছে। PostgreSQL আরও জনপ্রিয় হয়ে উঠছে কারণ এটি স্কেলযোগ্য এবং ট্যাবুলার রিলেশনাল সিস্টেমে কাজ করে এটি ডেটার নিরাপত্তা নিশ্চিত করে এবং ডেটার সঠিকতা বজায় রাখে। এটি প্রায় সব ধরনের প্রোগ্রামিং ভাষা সাপোর্ট করে। অনেক কোম্পানি এবং সরকারি সংস্থাগুলো PostgreSQL ডেটাবেস ব্যবহার করে। Netflix, Uber, Instagram, Spotify, Skype etc PostgreSQL ডেটাবেস ব্যবহার করে।

### Database Schema কাজ ?

ডাটাবেস স্কিমা হলো ডাটাবেসের একটা নকশা । ডাটাবেসে তথ্য কীভাবে সাজানো থাকবে এবং একটার সঙ্গে আরেকটার সম্পর্ক কী হবে তা স্কিমা টীক করে। এর মূল উদ্দেশ্য হলো তথ্য গুছিয়ে রাখা।এটা ডাটাবেস ম্যানেজমেন্টকে সহজ করে, একই নামের সমসা এড়াতে সাহায্য করে, একসাথে কাজ করা সহজ হয় এবং কে কোন ডেটাতে অ্যাক্সেস পাবে সেটাও নিয়ন্ত্রণ করা যায়।

একটা ই-কমার্স অ্যাপ্লিকেশনএ আমরা আলাদা আলাদা স্কিমা বানাতে পারি, যেমন— products, users আর orders নামে। প্রতিটা স্কিমার মধ্যে সংশ্লিষ্ট টেবিল আর অন্যান্য জিনিস থাকবে। এতে করে সবকিছু সুন্দরভাবে গুছিয়ে রাখা যায়, এবং ডাটাবেস বড় হলেও মেইনটেইন করা সহজ হয়।

### Primary Key ও Foreign Key ?

Primary Key একটি row কে আলাদাভাবে চিহ্নিত করে, এবংForeign Key দুটি টেবিলের মধ্যে সম্পর্ক তৈরি করে, যা অন্য একটি টেবিলের Primary Key কে রেফারেন্স করে।

নিচে দুটি ছোট টেবিলের উদাহরণ দেওয়া হলো যেগুলো একটি Foreign Key দিয়ে পরস্পরের সাথে সম্পর্কিত।

```
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

এখানে,
customer_id হলো Primary Key এটি customers টেবিলের প্রতিটি সারিকে আলাদাভাবে চিহ্নিত করে।

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

এখানে order_id হলো Primary Key এটি orders টেবিলের প্রতিটি সারিকে আলাদাভাবে চিহ্নিত করে।

আর customer_id হলো Foreign Key এটি customers টেবিলের customer_id-এর উপর নির্ভর করে, অর্থাৎ কোন customer অর্ডার দিয়েছে, তা নির্দেশ করে।

```

### VARCHAR ও CHAR ?

CHAR নির্দিষ্ট দৈর্ঘ্যের জন্য ব্যবহৃত হয়, তবে ভেরিয়েবলের দৈর্ঘ্য ছোট বা বড় হোক, এটি সবসময় উল্লেখিত সম্পূর্ণ জায়গা ব্যবহার করে।

আর VARCHAR নির্দিষ্ট সর্বোচ্চ দৈর্ঘ্যের জন্য ব্যবহৃত হয়, কিন্তু এটি ভেরিয়েবলের প্রকৃত দৈর্ঘ্য অনুযায়ী জায়গা ব্যবহার করে।

দুটি কলাম একটি CHAR(5), আরেকটি VARCHAR(5)।

```

CREATE TABLE something_char (
    name CHAR(10)
);
CREATE TABLE something_varchar (
    name VARCHAR(50)
);


INSERT INTO something_char VALUES ('some');
INSERT INTO something_varchar VALUES ('some');

এখানে something_char টেবিলে some ১০ দৈর্ঘ্যের জায়গা নিবে,যদিও some এর দৈর্ঘ্য ৪ ।

আর something_varchar টেবিলে some মাত্র ৪ দৈর্ঘ্যের জায়গা নিবে, যদিও VARCHAR-এর দৈর্ঘ্য ৫০ ।


```

### COUNT(),AVG(),SUM() aggregate function ?

একটি Aggregate Function একাধিক মানের উপর calculation চালায় এবং একটি result দে ।
এই ফাংশনগুলো সাধারণত GROUP BY এর সাথে ব্যবহার করা হয়।

example ::

```
id	name	marks
1	রহিম	80
2	করিম   75
3	সুমন	90

SELECT COUNT(*) FROM students;
COUNT() -- কতজন ছাত্র আছে সেটা দিবে।

SELECT AVG(marks) FROM students;
AVG() -- গড় নম্বর দিবে।

SELECT SUM(marks) FROM students;
SUM() — সব নম্বর যোগ করে দিবে।


```
