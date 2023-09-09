enum Option {
  completed,
  uncompleted,
}

String optionToString(Option option) {
  switch (option) {
    case Option.completed:
      return "tamamlandı";
    case Option.uncompleted:
      return "tamamlanmadı";
    default:
      return "tamamlanmadı";
  }
}
