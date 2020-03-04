class NoteItem {
  String NoteTitle;
  String NoteContent;

  NoteItem(this.NoteTitle, this.NoteContent);
}

List<NoteItem> noteList = [
  new NoteItem("2020.02.29", "参考其他项目学习Flutter"),
  new NoteItem("2020.03.01", "学习了Markdown，有些语法还挺奇葩的"),
  new NoteItem("2020.03.02", "美团的学习资料很详细，为什么没有推广Flutter呢？")
];
