package biz.board;

public class bbqBoardVO {
   //메개변수
   private int num;
   private String store;
   private String title;
   private String type;
   private String writer;
   private String contact;
   private String content;
   private int ref;
   private int re_step;
   private int re_level;
   private int readcount;
   
   //디폴트 생성자
   public bbqBoardVO() {
      
   }

   public int getNum() {
      return num;
   }

   public void setNum(int num) {
      this.num = num;
   }

   public String getStore() {
      return store;
   }

   public void setStore(String store) {
      this.store = store;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }
   public String getReg_date() {
	   return reg_date;
   }
   
   public void setReg_date(String reg_date) {
	   this.reg_date = reg_date;
   }
   
   private String reg_date;   

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getContact() {
      return contact;
   }

   public void setContact(String contact) {
      this.contact = contact;
   }

   public int getRef() {
      return ref;
   }

   public void setRef(int ref) {
      this.ref = ref;
   }

   public int getRe_step() {
      return re_step;
   }

   public void setRe_step(int re_step) {
      this.re_step = re_step;
   }

   public int getRe_level() {
      return re_level;
   }

   public void setRe_level(int re_level) {
      this.re_level = re_level;
   }

   public int getReadcount() {
      return readcount;
   }

   public void setReadcount(int readcount) {
      this.readcount = readcount;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }
   
   }