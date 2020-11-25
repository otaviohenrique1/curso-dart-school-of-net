import 'dart:html';

Element link;

void click(String seletor) {
  link = querySelector(seletor);
  link.onClick.listen(printConsole);
}

void printConsole(Event event) {
  event.preventDefault();
  var msg = messageToConsole(link.attributes['href']);
  print(msg);
}

String messageToConsole(String url) {
  return 'Clicou em ' + url;
}
