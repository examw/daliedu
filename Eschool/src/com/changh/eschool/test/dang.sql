
CREATE TABLE d_product (
  id int identity(1,1) primary key ,
  product_name varchar(100) NOT NULL,
  description varchar(100) default NULL,
  add_time bigint(20) default NULL,
  fixed_price double NOT NULL,
  dang_price double NOT NULL,
  keywords hvarchar(200) default NULL,
  has_deleted int(1) NOT NULL default '0',
  product_pic varchar(200) default NULL,
) 
INSERT INTO d_product VALUES (1,'窗边的小豆豆','《窗边的小豆�?新版)》成�?0世纪全球最有影响的作品之一�?',1293811200000,25,18.80,'key',0,'1.jpg');
INSERT INTO d_product VALUES (2,'童年 在人�?我的大学','《童年》、《在人间》、《我的大学》是苏联作家高尔基著名的自传体三部曲小说�?',1243785600000,29.80,19.80,'key',0,'2.jpg');
INSERT INTO d_product VALUES (3,'海水观赏�?宠物100','覆盖地球表面77％的海洋，给种类繁多的海洋生物提供了备具特色的栖息场所�?',1046448000000,28,26.80,'key',0,'3.jpg');
INSERT INTO d_product VALUES (4,'小妇�?','《小妇人》的主要内容是：马奇一家有四个姐妹，生活清贫、简单而又温馨�?',1088611200000,26.00,18.20,'key',0,'4.jpg');
INSERT INTO d_product VALUES (5,'双螺�?发现DNA结构的故�?','《双螺旋:发现DNA结构的故事》：DNA结构的发现是20世纪最伟大的科学成就之一!',1251734400000,29.00,19.70,'key',0,'5.jpg');
INSERT INTO d_product VALUES (6,'Jane Eyre','《Jane Eyre(简�?》讲述了简·爱自幼父母双亡，投靠冷酷的舅母，但舅母无情地抛弃了她�?',704749600000,27.00,16.00,'key',0,'6.jpg');
INSERT INTO d_product VALUES (7,'Java就业培训教程','《Java 就业培训教程》全书共�?1章�?',1183219200000,39.00,29.20,'key',0,'7.jpg');
INSERT INTO d_product VALUES (8,'茶花�?','《茶花女》为我们塑造了一些生动、鲜明的艺术形象，而其中最突出、最令人难忘的自然是女主人公茶花女玛格丽特�?',1241107200000,22.00,11.00 ,'key',0,'8.jpg');
INSERT INTO d_product VALUES (9,'雪莱抒情诗�?','《雪莱抒情诗选》，本书选取了其早期诗作12篇以�?816年至1822�?0余篇诗作',1306857600000,20.00,15.00,'key',0,'9.jpg');
INSERT INTO d_product VALUES (10,'在人�?','《在人间(青少�?》是高尔基自传体小说三部曲中的第二部�?',1262275200000,22.50,11.40 ,'key',0,'10.jpg');
INSERT INTO d_product VALUES (11,'Gone With The Wind','Gone With The Wind',1262275200000,130.00,70.60,'key',0,'11.jpg');
INSERT INTO d_product VALUES (12,'关键管理问题','关键管理问题:各种商业模式的睿智精要》中所使用的独特的概念并给读者介绍如何使用《关键管理问�?各种商业模式的睿智精要》�?',1301587200000,36.00,23.40,'key',0,'12.jpg');
INSERT INTO d_product VALUES (13,'孩子，我们一路同�?','《孩子我们一路同�?做学习型家长》全面介绍了什么是学习形家�?学习的途径、态度、方�?',1054396800000,10.00,6.90,'key',0,'13.jpg');
INSERT INTO d_product VALUES (14,'傲慢与偏�?','《Pride and Prejudice(英文�?》是简·奥斯丁的代表作�?',1220198400000,28.00,17.10,'key',0,'14.jpg');
INSERT INTO d_product VALUES (15,'童年','《童年》与其续篇《在人间》《我的大学》共同构成了高尔基自传体小说三部�?',1317398400000,18.00,12.20,'key',0,'15.jpg');
INSERT INTO d_product VALUES (16,'一个陌生女人的来信','《一个陌生女人的来信》为茨威格代表作之一',1214841600000,18.00,11.70,'key',0,'16.jpg');
INSERT INTO d_product VALUES (17,'鲁滨逊漂流记','《鲁滨逊漂流记》以苏格兰水手亚历山大·赛尔柯尔在荒岛上的真实经历为原型创作而成',1249056000000,12.80,8.70,'key',0,'17.jpg');
INSERT INTO d_product VALUES (18,'老子�?智者的低语','《老子�?智者的低语》内容丰富、资料翔实、图文并茂，介绍的是老子�?',1193846400000,18.50,13.90,'key',0,'18.jpg');
INSERT INTO d_product VALUES (19,'达•芬奇密�?','《达•芬奇密码》让人绞尽脑汁的密码，就隐藏在列昂纳多•达•芬奇的艺术作品当中',1241107200000,26.00,16.30,'key',0,'19.jpg');
INSERT INTO d_product VALUES (20,'淘气包冯小跳','马小跳的同桌冤家是班上的中队长路曼曼，她是班主任秦老师派来管马小跳的�?',1293811200000,15.00,12.20,'key',0,'20.jpg');
INSERT INTO d_product VALUES (21,'夏洛的网','夏洛的网(中英双语精装�?》傲居“美国最伟大的十部儿童文学名著”之�?',1251734400000,28.00,18.20,'key',0,'21.jpg');
INSERT INTO d_product VALUES (22,'Servlet与JSP核心编程(�?�?�?�?','Servlet与JSP核心编程(�?�?�?�?',1243785600000,68.00,51.00,'key',0,'22.jpg');
INSERT INTO d_product VALUES (23,'庐隐作品�?','庐隐的作品充斥了苦闷愤世的悲哀。她追求人生的意义，但看不到人生的前途�?',1272643200000,23.96,15.10,'key',0,'23.jpg');
INSERT INTO d_product VALUES (24,'门口的野蛮人:史上最强悍的资本收�?','对于那些不怀好意的收购者，华尔街通常称之为“门口的野蛮人”�?',1283270400000,52.00,36.50,'key',0,'24.jpg');



DROP TABLE IF EXISTS d_book;
CREATE TABLE d_book (
  id int(12) NOT NULL,
  author varchar(200) NOT NULL,
  publishing varchar(200) NOT NULL,
  publish_time bigint(20) NOT NULL,
  word_number varchar(15) default NULL,
  which_edtion varchar(15) default NULL,
  total_page varchar(15) default NULL,
  print_time int(20) default NULL,
  print_number varchar(15) default NULL,
  isbn varchar(25) default NULL,
  author_summary text NOT NULL,
  catalogue text NOT NULL,
  PRIMARY KEY  (id)
) 

INSERT INTO d_book VALUES (1,'黑柳彻子','南海出版�?',1293811200000,'1�?','第二�?','272',1,NULL,'754425058X','生于1933�?�?日，日本著名作家、著名演员、著名电视节目主持人、联合国儿童基金会亲善大�?','《窗边的小豆�?新版)》讲述了作者上小学时的一段真实的故事。作者因淘气被原学校退学后，来到巴学园。在小林校长的爱护和引导下，一般人眼里“怪怪”的小豆豆逐渐成了一个大家都能接受的孩子，并奠定了她一生的基础。《窗边的小豆�?新版)》不仅带给世界千万读者无数的笑声和感动，而且为现代教育的发展注入了新的活力，成为20世纪全球最有影响的作品之一�?);
INSERT INTO d_book VALUES (2,'高尔�?','凤凰出版传媒集团，译林出版社',1243785600000,'1�?','第一�?','191',1,NULL,'9787530119020','高尔基（1868�?936）前苏联无产阶级作家，社会主义现实主义文学的奠基人�?','《童年·在人间·我的大学》讲述了：《童年》、《在人间》、《我的大学》是苏联作家高尔基著名的自传体三部曲小说，作者通过对自己童年、少年和青年时代生活和命运的描写，展现了俄国十月革命前一位进步青年的成长历程。小主人公阿廖沙(高尔基的小名)在父亲去世后，来到了外祖父家，并在那里度过了自己的童年。随着母亲的去世，外祖父家道的中落，阿廖沙不得不走向人间，靠做学徒、给人家打工过活。正是在这段时间，阿廖沙接触了书籍，并从此沉浸于书的世界。书中的知识开拓了阿廖沙的眼界。怀着对理想的追求，阿廖沙只身来到喀山求学。在俄国革命的暗流涌动和一群进步人士的熏陶下，他的思想境界得到了升华。阿廖沙这一世界经典文学形象，长久地留在人们心田并始终激励着人们为美好的明天而奋�? ');
INSERT INTO d_book VALUES (3,'张词�?','中国林业出版�?',1046448000000,'1�?','第一�?','143',1,NULL,'7503832800','作者是好人','覆盖地球表面77％的海洋，给种类繁多的海洋生物提供了备具特色的栖息场所，世界上已查明的海洋鱼类约有2万余种。由于海洋环境的复杂多变，尤其是生活在热带和亚热带海域的珊瑚礁鱼类，其种类繁多，色彩艳丽多变，姿态优雅，有明显的环境适应能力，因而成为广大养鱼爱好者昕喜爱的饲养观赏鱼，被人们称为“珊瑚鱼”。在水族箱中，要创造类似海洋珊瑚礁的自然环境是非常困难的，加之对水质、饲养设备及条件要求较高，成本大，因此人工饲养珊瑚鱼比饲养淡水鱼难得多。近年来，由于在运输、饲养鱼病防治、饲养设备和人工海水配制方面有了较大的进步，特别是过滤装置的更新换代，对解决亚硝酸盐递增这一问题起了很大作用，使海水观赏鱼的饲养逐渐趋向大众化，并在我国得到了长足的进展�?);
INSERT INTO d_book VALUES (4,'路易莎•奥尔科�?','人民文学出版�?',1088611200000,'1�?','第一�?','590',1,NULL,'7020047181','作者是好人','《小妇人》的主要内容是：马奇一家有四个姐妹，生活清贫、简单而又温馨。四组妹性格迥异；老大梅格漂亮端庄，有些爱慕虚荣；老二贝丝善良羞涩，热爱音乐，老三乔自由独立，渴望成为作家，老四埃米聪慧活泼，爱好艺术，希望成为一名上流社会的“淑女”。所有时代的所有少女成长过程中所要面对的经历的，都可以在此书中找到：初恋的甜密和烦恼，感情与理智的译，理想和现实的差距，贫穷与富有的矛盾。《小妇人》故事情节简单真实，却感人至深，问世一百多年以来，多次被般上银幕，并被译成各种文字，成为世界文学宝库中的经典名作。书中描写的种种情感体验和生活经历，都曾经、正在并将要发生在每一个少女走向成熟的过程之中；书中提倡善良、忠诚、无私、慷概、尊严、宽容、坚韧、勇敢、亦是人类永远尊崇和追求的美德和信低仰。所有这些，赋予此书超赵时代和国度的生命力，这也正是她成为不朽的典的魅力和原因所在�?);
INSERT INTO d_book VALUES (5,'James D.Watson','化学工业出版�?',1251734400000,'1�?','第一�?','188',1,NULL,'9787122054500','作者是好人','《双螺旋:发现DNA结构的故事》：DNA结构的发现是20世纪最伟大的科学成就之一!本书告诉你这个伟大发现是如何发生的。本书是最经典的生命科学科普图书之一，是诺贝尔生理学或医学奖获得者沃森的大作。作者用讲故事的方式详细介绍了DNA双螺旋这个惊人发现的全过程，提供了科学发现的一般过程与思路，无论是痴迷于科学世界的青少年，还是一般生物学工作者、科学史工作者，都会从中得到启发、有所获益�?);
INSERT INTO d_book VALUES (6,'Charlotte Bronte',' Wordsworth Editions Ltd',704649600000,'1�?','第一�?','410',1,NULL,'1853260207','作者是好人','《Jane Eyre(简�?》讲述了这样一个故事：简·爱自幼父母双亡，投靠冷酷的舅母，但舅母无情地抛弃了她。她在一所慈善学校做了六年的学生和两年的教师。十八岁时，简·爱受聘到桑菲尔德府学当家庭教师，认识了主人罗切斯特。两人都被对方独特的气质和丰富的感情所吸引，于是不顾身份和地位的巨大差距深深相爱了。正当他们举行婚礼时，有人证明罗切斯特的前妻还活着。简·爱知道他们不可能有平等的婚姻，于是选择了离开。后来，简·爱意外遇见了她的表兄妹们，并从叔叔那里继承了一笔遗产。但她无法抵御对罗切斯特的刻骨思念，于是便回到了已经失去了财富、身体也遭到火灾严重摧残的罗切斯特身边，毅然跟他结婚。在爱的沐浴下，罗切斯特找回了幸福和健康�?);
INSERT INTO d_book VALUES (7,'张孝�?','清华大学',1183219200000,'1�?','第一�?','394',1,NULL,'7302072957','作者是好人','《Java 就业培训教程》全书共�?1章。第1章详细地讲解了Java开发环境的搭建、反编译工具的使用、JDK文档资料的查阅以及Java程序的编译和运行过程。第2章系统地讲解了Java的一些常用语法，在讲解语法的过程中，作者把常见问题进行了正反对比，分析了问题产生的根源，旨在加深印象。在�?章和�?章中，透彻系统地讲解了面向对象的思想和应用，用通俗形象的语言、典型翔实的例子、鲜明的对照比较，阐述了初学者最容易迷惑的一些思想理念。在以后的章节中，作者始终以“启发编程思想，培养编程感觉”为指导，以剖析典型实例、分析源码结构含义、解析常见问题等方式，从高屋建瓴的角度，用通俗易懂的文字，讲解了多线程、常用Java类、Java中的I/O（输入输出）编程、GUI与Applet、网络编程等方面的知识�?作者长期工作在开发与教学的第一线，既考虑了在实际开发中经常遇到的难题，也分析了众多学员在学习中经常困惑的问题�?);
INSERT INTO d_book VALUES (8,'小仲�?','上海三联书店',1241107200000,'1�?','第一�?','220',1,NULL,'7542630504','作者是好人','《茶花女》为我们塑造了一些生动、鲜明的艺术形象，而其中最突出、最令人难忘的自然是女主人公茶花女玛格丽特。读者们切莫把玛格丽特和阿尔丰西娜·普莱西小姐混为一谈，阿尔丰西娜的身世固然值得同情，但她的的确确是个堕落的女人，用小仲马的话来说，她“既是一个纯洁无瑕的贞女，又是_个彻头彻尾的娼妇”。但玛格丽特却不同，她美丽、聪明而又善良j虽然沦落风尘，但依旧保持着一颗纯洁、高尚的心灵。她充满热情和希望地去追求真正的爱情生活，而当这种希望破灭之后，又甘愿自我牺牲去成全他人。这一切都使这位为人们所不齿的烟花女子的形象闪烁着一种圣洁的光辉，以至于人们一提起“茶花女”这三个字的时候，首先想到的不是什么下贱的妓女，而是一位美丽、可爱而又值得同情的女眭。古今中外的文学名著为人们留下了许许多多不朽的艺术形象，而玛格丽特则完全可以跻身其间而毫无愧色�?);
INSERT INTO d_book VALUES (9,'雪莱','商务印书�?',1306857600000,'1�?','第一�?','239',1,NULL,'9787100073875','作者是好人','《雪莱抒情诗选》，本书选取了其早期诗作12篇以�?816年至1822�?0余篇诗作，以时间为序，反映了他思想的矛盾、斗争和发展过程�?);
INSERT INTO d_book VALUES (10,'高尔�?','北方妇女儿童出版�?',1262275200000,'1�?','第二�?','168',1,NULL,'9787538534351','高尔基（1868�?936）前苏联无产阶级作家，社会主义现实主义文学的奠基人�?','《在人间(青少�?》是高尔基自传体小说三部曲中的第二部。小说描述了主人公阿廖沙�?871年到1884年的生活。为了生活，他和外祖母摘野果去卖来糊口，他还当过绘图师的学徒，在船上当过洗碗工，当过圣像作坊的学徒。在人生的道路上，他历尽坎坷，与社会底层的人们打交道，同时他还有机会阅读大量书籍。生活阅历和大量的阅读拓宽了阿廖沙的视野，他决心“做个顽强的人，不向环境的压力屈服”。怀着这样的信念，他离开家乡奔赴喀山�?);
INSERT INTO d_book VALUES (11,'Margaret Mitchell','Scribner Book Company; Anniversary',1262275200000,'1�?','1','959',1,NULL,'1451635621','作者是好人','Margaret Mitchell is epic novel of love and war won the Pulitzer Prize and went on to give rise to two authorized sequels and one of the most popular and celebrated movies of all time.Many novels have been written about the Civil War and its aftermath. None take us into the burning fields and cities of the American South as Gone With the Wind does, creating haunting scenes and thrilling portraits of characters so vivid that we remember their words and feel their fear and hunger for the rest of our lives.In the two main characters, the white-shouldered, irresistible Scarlett and the flashy, contemptuous Rhett, Margaret Mitchell not only conveyed a timeless story of survival under the harshest of circumstances, she also created two of the most famous lovers in the English-speaking world since Romeo and Juliet.');
INSERT INTO d_book VALUES (12,'汤姆•兰伯特','地球出版�?',1301587200000,'1�?','第二�?','307',1,NULL,'9787509612392','作者是好人','《关键管理问�?各种商业模式的睿智精要》中所使用的独特的概念并给读者介绍如何使用《关键管理问�?各种商业模式的睿智精要》。一种实用的思想——领导需要合适的人在适当的时间提出正确的问题。《关键管理问�?各种商业模式的睿智精要》提出了最根本的问题，并对如何实施这些答案使其发挥最大的功效提供了明确的指导�?);
INSERT INTO d_book VALUES (13,'王晓�?','中国妇女出版�?',1054396800000,'1�?','第一�?','100',1,NULL,'780131815','王晓�?1943年生,北京�?北京教育科学研究院基础教育研究所高级教师�?','《孩子我们一路同�?做学习型家长》全面介绍了什么是学习形家�?学习的途径、态度、方�?并从家庭教育转轨的角�?谈如何做一个现代家�?做一个学习型家长。《孩子我们一路同�?做学习型家长》内容包�?什么是学习型家�?做学习型家长的学习途径;做学习型家长的学习态度;做学习型家长的学习方�?中国家庭教育的六大转轨及对策;成为孩子的朋友——做一个民主的家长;成为信息的主人——做一个开放的家长;保持一颗平常心——做一个理智的家长;再富不能富孩子——做一个淡泊的家长;自己孩子自己管——做一个自主的家长;内行才能看门道——做一个懂学习的家长等�?);
INSERT INTO d_book VALUES (14,'简·奥斯汀','中央编译出版�?',1220198400000,'1�?','第一�?','505',1,NULL,'9787802117327','作者是好人','《Pride and Prejudice(英文�?》是简·奥斯丁的代表作。小说以18世纪�?9世纪初保守，闭塞的英国乡村生活为背景。通过几个中产阶级少女对终身大事的处理，表达了这一社会阶层的婚姻恋爱观为了财产和地位而结婚是错误的。但结婚不考虑财产也是愚蠢的小说的女主人公伊丽莎白出生于平民阶层却为富家子弟达西所心仪。服了当时的门第观念、向伊丽莎白求婚，却遭到拒绝。原来伊丽莎白误信了谗言。最后误会涣然冰释，达西又帮助伊丽莎白的一个私奔的妹妹完婚，挽回家庭的声终于赢得了她的爱情。同时，小说中还描写了伊丽莎白的几个姐妹和女友的婚事以此与主人公理想的婚姻相对照。作品语言清新洗练。风趣机智，情节曲折有致，极富戏剧色彩，是奥斯了一生创作的六部小说中最受人们喜爱的一部�?);
INSERT INTO d_book VALUES (15,'高尔�?','译林出版�?',1317398400000,'1�?','第一�?','245',1,NULL,'9787544717991','高尔基（1868�?936）前苏联无产阶级作家，社会主义现实主义文学的奠基人�?','《童年》与其续篇《在人间》《我的大学》共同构成了高尔基自传体小说三部曲，描写了“我”的成长过程，从中我们可以了解到高尔基的成长历程。《童年》是三部曲的首篇，讲述的是孤独孩童“我�?阿廖�?的成长故事，记叙了主人公成长、生活的历程，以一个孩子的独特视角来审视整个社会及人生，描写了那令人窒息的、充满可怕景象的狭小天地。阿廖沙四岁时，父亲就死了，于是，他跟着外祖父、外祖母过着贫寒、艰苦的生活。外祖父家是一个充满仇恨、笼罩着浓厚小市民习气的、令人窒息的家庭。外祖父有着矛盾复杂的性格，他的内心有善良的一面，但贪婪腐蚀了他的灵魂。在这冷冰冰的世界里，只有外祖母庇护、关心着他，给予他无限的温情和关爱，并对他进行了有益的教导。此外，小说也展现了当时整个社会的腐败、没落而趋向灭亡的过程。小说通过“我”幼年时代痛苦生活的叙述，实际反映了作家童年时代的艰难生活及对光明与真理的不懈追求，同时也展现了19世纪末俄国社会的广阔社会画卷�?);
INSERT INTO d_book VALUES (16,'斯台芬•茨威格','上海译文出版�?',1214841600000,'1�?','第一�?','299',1,NULL,'7532745368','作者是好人','《一个陌生女人的来信》为茨威格代表作之一。一个男子在四十一岁生日当天收到一封没有署名和地址的信，一个临死的女人，讲述了一个刻骨铭心的爱情故事，而故事的男主人公也就是收信的这个男人对此一无所知。故事始自十八年前，她初遇男人的刹那，还是个孩子，之后经历了少女的痴迷、青春的激情，甚而流落风尘，但未曾改变对男人的爱，直至临死前才决定告白�?);
INSERT INTO d_book VALUES (17,'迪福','凤凰出版传媒集团，译林出版社',1249056000000,'1�?','第一�?','168',1,NULL,'9787544708968','作者是好人','《鲁滨逊漂流记》以苏格兰水手亚历山大·赛尔柯尔在荒岛上的真实经历为原型创作而成。小说分三部分：第一部分写鲁滨逊初出茅庐，最初三次航海的经过及其在巴西经营种植园的情况；第二部分详细描述了主人公流落荒岛，独�?8年的种种情景；第三部分简要交代了鲁滨逊回国后的命运及这个海岛未来的发展趋向。第二部分是主体�?);
INSERT INTO d_book VALUES (18,'蔡志�?','生活·读书·新知三联书店',1193846400000,'1�?','第一�?','174',1,NULL,'9787108013835','作者是好人','《老子�?智者的低语》详细内容有滋润心灵的甘泉、新生代的糖农古籍、庆幸自己是中国人、生命的大智慧、老子其犹龙乎、道《上篇》、道可道，非常道、天下皆知美、不尚贤、道冲、天地不仁、谷神不死，是谓玄牝、天长地久、上善若水、持而盈之、载营魄抱、三十辐、五色令人目盲、宠辱若惊、视之不见，名曰夷、古之善为道者、致虚极等�?);
INSERT INTO d_book VALUES (19,'丹•布�?','人民文学出版�?',1241107200000,'1�?','第一�?','378',1,NULL,'9787020069828','作者是好人','《达•芬奇密码》内容简介：午夜，卢浮宫博物馆年迈的馆长被人杀害在大陈列馆的镶木地板上。在人生的最后时刻，馆长脱光了衣服，明白无误地用自己的身体摆成了达•芬奇名画《维特鲁维人》的样子，还在尸体旁边留下了一个令人难以捉摸的密码。符号学专家罗伯特•兰登与密码破译天才索菲•奈芙，在对一大堆怪异的密码进行整理的过程当中，发现一连串的线索竟然隐藏在达•芬奇的艺术作品当中!兰登猛然领悟到，馆长其实是郇山隐修会的成员——这是一个成立于1099年的秘密组织，其成员包括西方历史上诸多伟人，如：牛顿、波提切利、维克多•雨果，以及达•芬�?兰登怀疑他们是在找寻一个石破天惊的历史秘密，一个既能给人启迪又异常危险的秘密。兰登与奈芙跟一位神秘的幕后操纵者展开了斗智斗勇的角逐，足迹遍及巴黎、伦敦，不断遭人追杀。除非他们能够解开这个错综复杂的谜，否则，郇山隐修会掩盖的秘密，里面隐藏的那个令人震惊的古老真相，将永远消逝在历史的尘埃之中�?);
INSERT INTO d_book VALUES (20,'杨红�?','接力出版�?',1293811200000,'1�?','第二�?','134',1,NULL,'9787544816090','杨红樱，四川作家协会副主席，成都文联副主席。曾傲过小学老师、儿童读物编辑、儿童刊物主编，享受国务院特殊津贴的“有突出贡献的专家”�?','马小跳的同桌冤家是班上的中队长路曼曼，她是班主任秦老师派来管马小跳的。她有一个小本子，每时每刻都在记录马小跳的不良行为，他们俩每天都有战争要发生。可是，路曼曼在竞选学校的大队长时，马小跳却绞尽脑汁为她拉选票；而路曼曼生病时，她一见到马小跳，病全好了。这是为什么呢�?);
INSERT INTO d_book VALUES (21,'E•B•怀�?','上海译文出版�?',1251734400000,'1�?','第一�?','351',1,NULL,'9787532748594','E·B·怀特（1899-1985），美国最伟大的散文家和儿童文学家�?','《夏洛的�?中英双语精装�?》傲居“美国最伟大的十部儿童文学名著”之首。在朱克曼家的谷仓里，快乐地生活着一群动物，其中小猪威尔伯和蜘蛛夏洛建立了最真挚的友谊。然而，一个最丑恶的消息打破了谷仓的平静：威尔伯未来的命运竞是成为熏肉火腿。作为一只小猪，悲痛绝望的威尔伯似乎只能接受任人宰割的命运了，然而，看似渺小的夏洛却说：“我救你。”于是，夏洛用自己的丝在猪栏上织出了被人类视为奇迹的网上文字，彻底逆转了威尔伯的命运，终于让它在集市的大赛中赢得特别奖，和一个安享天命的未来。但，这时，蜘蛛夏洛的生命却走到了尽头…�?);
INSERT INTO d_book VALUES (22,'霍尔','清华大学出版�?',1243785600000,'1�?','第二�?','528',1,NULL,'9787302203087','作者是好人','《Servlet与JSP核心编程(�?�?�?�?》在第l卷的基础上，广泛涉及自定义标签库、过滤器、声明式安全、JSTL和Struts等主题，并沿袭深受读者喜爱的写作风格，通过完整、有效、资料丰富的程序来演绎目前最流行的技术和最佳实践。Java EE已经成为电子商务网站、动态网站和Web应用与服务开发的首选，作为这一平台的基础，servlet与JSP的重要性日益突出，并在极短的时间内得以迅速普及。透过《Servlet与JSP核心编程(�?�?�?�?》，读者可以掌握如何通过部署描述文件web．xml来控制Web应用的行为，如何通过声明式安全和编程式安全来增强Web应用的安全，如何使用servlet和JSP过滤器来封装Web应用常见的行为。同时，读者还将学会如何控制Web应用生命周期中的主要事件，掌握JSTL最佳实践，了解如何构建自定义标签库。此外，《Servlet与JSP核心编程(�?�?�?�?》还用较多篇幅深入介绍了Jakarta Struts框架�?);
INSERT INTO d_book VALUES (23,'庐隐','中国画报出版�?',1272643200000,'1�?','第一�?','256',1,NULL,'9787802207592','庐隐�?899�?934），原名黄淑仪，又名黄英，生于福建闽侯，自幼家居北平�?','《庐隐精品文集》内容简介：庐隐�?899�?934），原名黄淑仪，又名黄英，生于福建闽侯，自幼家居北平�?901年入慕贞书院小学部，1912年考入北平女子师范学校�?919年考入北京高等女子师范国文系�?921年加入文学研究会，成为中国最早塑造系列女性形象的作家�?934年死于难产。茅盾评价说：“在庐隐的作品中，我们也看见了同样的对于‘人生问题’的苦索，不过她是穿了恋爱的衣裳。”庐隐的作品充斥了苦闷愤世的悲哀。她追求人生的意义，但看不到人生的前途。在中国早期的现代文学中庐隐是与冰心、石评梅齐名的文坛才女，在弥漫小资情调盛行靡丽又风之际，她的作品远远超越了她所处的时代，创造了独树一帜的文体，从而奠定了她在现代文学史中的地位。《庐隐精品文集》选编了庐隐作品的大部分，基本可以反映作者的思想和艺术取向�?);
INSERT INTO d_book VALUES (24,'布赖恩•伯�?','机械工业出版�?',1283270400000,'1�?','第一�?','431',1,NULL,'9787111314943','作者是好人','对于那些不怀好意的收购者，华尔街通常称之为“门口的野蛮人”。《门口的野蛮�?史上最强悍的资本收�?20周年纪念�?》是迄今为止最具影响力的商业书籍之一，两位《华尔街日报》的记者凭借人脉和技巧，令当事人吐露真言，获取了第一手的资料，再辅以引人入胜的妙笔，曝露出那场华尔街金融史上规模空前的收购—�?988年KKR公司收购雷诺�?纳贝斯克集团的来龙去脉，以及华尔街金融操作的风风雨雨。书的前半部交待出主角们的发家史，俨然是美国经济浮世绘；后半部情节紧张，宛如悬疑小说。其间，华尔街的大亨们尔虞我诈，故事充满金融交易、舆论压力、决策博弈、社交晚宴和董事会议，不仅让读者见识到如此重大的收购在高层之间是如何运作的，也让我们看到一部充满洞见的金融社会史。在史上十大并购中，有九件都发生于近年，唯有这场收购发生�?0年前，足见它的重要性。许多知名商学院如今仍把《门口的野蛮�?史上最强悍的资本收�?20周年纪念�?》作为教材，讲述从商业伦理、公司理财到投资银行学的主题。更有相关电影与纪录片。在20周年纪念版中，作者又重新拜访了这场世纪收购的胜败双方，追踪余波，记叙参与者后续的成败荣辱，帮助人们更好地了解这场收购对世界的影响�?);


DROP TABLE IF EXISTS d_category;
CREATE TABLE d_category (
  id int(12) NOT NULL auto_increment,
  turn int(10) NOT NULL,
  en_name varchar(200) NOT NULL,
  name varchar(200) NOT NULL,
  description varchar(200),
  parent_id int(10),
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO d_category VALUES (1,1,'Book','图书',NULL,0);
INSERT INTO d_category VALUES (2,1,'Novel','小说',NULL,1);
INSERT INTO d_category VALUES (3,2,'Youth','青春',NULL,1);
INSERT INTO d_category VALUES (4,3,'Humanity And Social Science','人文社科',NULL,1);
INSERT INTO d_category VALUES (5,4,'Management','管理',NULL,1);
INSERT INTO d_category VALUES (6,5,'Children','少儿',NULL,1);
INSERT INTO d_category VALUES (7,6,'Foreign Language','外语',NULL,1);
INSERT INTO d_category VALUES (8,7,'Computer','计算�?,NULL,1);
INSERT INTO d_category VALUES (9,1,'Chinese Contemporary Novel','当代小说',NULL,2);
INSERT INTO d_category VALUES (10,2,'Chinese Modern Novel','近现代小�?,NULL,2);
INSERT INTO d_category VALUES (11,3,'Chinese Classical  Novel','古典小说',NULL,2);
INSERT INTO d_category VALUES (12,4,'Four Classic Novels','四大名著',NULL,2);
INSERT INTO d_category VALUES (13,5,'Translated Works','世界名著',NULL,2);
INSERT INTO d_category VALUES (14,1,'School','校园',NULL,3);
INSERT INTO d_category VALUES (15,2,'Love','爱情/情感',NULL,3);
INSERT INTO d_category VALUES (16,3,'Grow Up','叛�?成长',NULL,3);
INSERT INTO d_category VALUES (17,4,'Fantasy','玄幻',NULL,3);
INSERT INTO d_category VALUES (18,5,'Original','原创',NULL,3);
INSERT INTO d_category VALUES (19,1,'Political','政治',NULL,4);
INSERT INTO d_category VALUES (20,2,'Economic','经济',NULL,4);
INSERT INTO d_category VALUES (21,3,'Law','法律',NULL,4);
INSERT INTO d_category VALUES (22,4,'Philosophy','哲学',NULL,4);
INSERT INTO d_category VALUES (23,5,'History','历史',NULL,4);
INSERT INTO d_category VALUES (24,1,'Commen Management','管理�?,NULL,5);
INSERT INTO d_category VALUES (25,2,'Strategic Management','战略管理',NULL,5);
INSERT INTO d_category VALUES (26,3,'Marketing','市场营销',NULL,5);
INSERT INTO d_category VALUES (27,4,'Business History','商业史传',NULL,5);
INSERT INTO d_category VALUES (28,5,'E-Business','电子商务',NULL,5);
INSERT INTO d_category VALUES (29,1,'0-2','0-2�?,NULL,6);
INSERT INTO d_category VALUES (30,2,'3-6','3-6�?,NULL,6);
INSERT INTO d_category VALUES (31,3,'7-10','7-10�?,NULL,6);
INSERT INTO d_category VALUES (32,4,'11-14','11-14�?,NULL,6);
INSERT INTO d_category VALUES (33,5,'Child Literature','儿童文学',NULL,6);
INSERT INTO d_category VALUES (34,1,'English','英语',NULL,7);
INSERT INTO d_category VALUES (35,2,'Japanese','日语',NULL,7);
INSERT INTO d_category VALUES (36,3,'Korean','韩语',NULL,7);
INSERT INTO d_category VALUES (37,4,'Russian','俄语',NULL,7);
INSERT INTO d_category VALUES (38,5,'German','德语',NULL,7);
INSERT INTO d_category VALUES (39,1,'Computer Theory','计算机理�?,NULL,8);
INSERT INTO d_category VALUES (40,2,'Database','数据�?,NULL,8);
INSERT INTO d_category VALUES (41,3,'Programming','程序设计',NULL,8);
INSERT INTO d_category VALUES (42,4,'Artificial Intelligence','人工智能',NULL,8);
INSERT INTO d_category VALUES (43,5,'Computer Examination','计算机考试',NULL,8);




DROP TABLE IF EXISTS d_category_product;
CREATE TABLE d_category_product (
  id int(12) NOT NULL auto_increment,
  product_id int(10) NOT NULL,
  cat_id int(10) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO d_category_product VALUES (1,1,9);
INSERT INTO d_category_product VALUES (2,2,13);

INSERT INTO d_category_product VALUES (3,3,9);
INSERT INTO d_category_product VALUES (4,4,9);
INSERT INTO d_category_product VALUES (5,5,9);
INSERT INTO d_category_product VALUES (6,6,11);
INSERT INTO d_category_product VALUES (7,7,11);
INSERT INTO d_category_product VALUES (8,8,13);
INSERT INTO d_category_product VALUES (9,9,11);
INSERT INTO d_category_product VALUES (10,10,11);
INSERT INTO d_category_product VALUES (11,11,10);
INSERT INTO d_category_product VALUES (12,12,10);
INSERT INTO d_category_product VALUES (13,13,10);
INSERT INTO d_category_product VALUES (14,14,10);
INSERT INTO d_category_product VALUES (15,15,13);
INSERT INTO d_category_product VALUES (16,16,13);
INSERT INTO d_category_product VALUES (17,17,10);
INSERT INTO d_category_product VALUES (18,18,12);
INSERT INTO d_category_product VALUES (19,19,10);
INSERT INTO d_category_product VALUES (20,20,10);
INSERT INTO d_category_product VALUES (21,21,12);
INSERT INTO d_category_product VALUES (22,22,10);
INSERT INTO d_category_product VALUES (23,23,10);
INSERT INTO d_category_product VALUES (24,24,12);

INSERT INTO d_category_product VALUES (25,1,2);
INSERT INTO d_category_product VALUES (26,2,2);
INSERT INTO d_category_product VALUES (27,3,2);
INSERT INTO d_category_product VALUES (28,4,2);
INSERT INTO d_category_product VALUES (29,5,2);
INSERT INTO d_category_product VALUES (30,6,2);
INSERT INTO d_category_product VALUES (31,7,2);
INSERT INTO d_category_product VALUES (32,8,2);
INSERT INTO d_category_product VALUES (33,9,2);
INSERT INTO d_category_product VALUES (34,10,2);
INSERT INTO d_category_product VALUES (35,11,2);
INSERT INTO d_category_product VALUES (36,12,2);
INSERT INTO d_category_product VALUES (37,13,2);
INSERT INTO d_category_product VALUES (38,14,2);
INSERT INTO d_category_product VALUES (39,15,2);
INSERT INTO d_category_product VALUES (40,16,2);
INSERT INTO d_category_product VALUES (41,17,2);
INSERT INTO d_category_product VALUES (42,18,2);
INSERT INTO d_category_product VALUES (43,19,2);
INSERT INTO d_category_product VALUES (44,20,2);
INSERT INTO d_category_product VALUES (45,21,2);
INSERT INTO d_category_product VALUES (46,22,2);
INSERT INTO d_category_product VALUES (47,23,2);
INSERT INTO d_category_product VALUES (48,24,2);

INSERT INTO d_category_product VALUES (49,1,1);
INSERT INTO d_category_product VALUES (50,2,1);
INSERT INTO d_category_product VALUES (51,3,1);
INSERT INTO d_category_product VALUES (52,4,1);
INSERT INTO d_category_product VALUES (53,5,1);
INSERT INTO d_category_product VALUES (54,6,1);
INSERT INTO d_category_product VALUES (55,7,1);
INSERT INTO d_category_product VALUES (56,8,1);
INSERT INTO d_category_product VALUES (57,9,1);
INSERT INTO d_category_product VALUES (58,10,1);
INSERT INTO d_category_product VALUES (59,11,1);
INSERT INTO d_category_product VALUES (60,12,1);
INSERT INTO d_category_product VALUES (61,13,1);
INSERT INTO d_category_product VALUES (62,14,1);
INSERT INTO d_category_product VALUES (63,15,1);
INSERT INTO d_category_product VALUES (64,16,1);
INSERT INTO d_category_product VALUES (65,17,1);
INSERT INTO d_category_product VALUES (66,18,1);
INSERT INTO d_category_product VALUES (67,19,1);
INSERT INTO d_category_product VALUES (68,20,1);
INSERT INTO d_category_product VALUES (69,21,1);
INSERT INTO d_category_product VALUES (70,22,1);
INSERT INTO d_category_product VALUES (71,23,1);
INSERT INTO d_category_product VALUES (72,24,1);
INSERT INTO d_category_product VALUES (73,15,1);
INSERT INTO d_category_product VALUES (74,2,1);

DROP TABLE IF EXISTS d_receive_address;
CREATE TABLE d_receive_address (
  id int(12) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  receive_name varchar(20) NOT NULL,
  full_address varchar(200) NOT NULL,
  postal_code varchar(8) NOT NULL,
  mobile varchar(15) default NULL,
  phone varchar(20) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB;

insert into d_receive_address values(1, 6,'Java','sun.cn','10000800','12345','67890');
insert into d_receive_address values(2, 6,'JavaJavaJava','ibm.cn','10000600','12345','67890');


DROP TABLE IF EXISTS d_order;
CREATE TABLE d_order (
  id int(10) NOT NULL auto_increment,
  user_id int(10) NOT NULL,
  address_id int(12) NOT NULL,
  status int(10) NOT NULL,
  order_time bigint(20) NOT NULL,
  order_desc varchar(100) default NULL,
  total_price double NOT NULL,
  constraint fk_order foreign key(address_id) references d_receive_address(id), 
 
  
  PRIMARY KEY  (id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS d_item;
CREATE TABLE d_item (
  id int(12) NOT NULL auto_increment,
  order_id int(10) NOT NULL,
  product_id int(10) NOT NULL,
  product_name varchar(100) NOT NULL,
  dang_price double NOT NULL,
  product_num int(10) NOT NULL,
  amount double NOT NULL,
  PRIMARY KEY  (id),
  constraint fk_item foreign key(order_id) references d_order(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;








DROP TABLE IF EXISTS d_user;
CREATE TABLE d_user (
  id int(12) NOT NULL auto_increment,
  email varchar(50) NOT NULL,
  nickname varchar(50) default NULL,
  password varchar(50) NOT NULL,
  user_integral int(12) NOT NULL default '0',
  is_email_verify char(3),
  email_verify_code varchar(50) default NULL,
  last_login_time bigint(20) default NULL,
  last_login_ip varchar(15) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


