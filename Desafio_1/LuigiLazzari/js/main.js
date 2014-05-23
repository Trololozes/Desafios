$('input').keyup(function() {
  var k = parseInt($('#shift').val()); //pega o valor de shift
  if (!(k >= 0 && k < 26)) {
    $('#mensagem').html('Valor deve ser entre 0 e 25'); //mensagem de erro
    return;
  }

  var texto = $('#texto').val().toLowerCase(); //converte o texto pra lowercase (preguiça)
  var cripto = ''; //declarando string do texto criptografado
  var alfabeto = 'abcdefghijklmnopqrstuvwxyz'; //declara a string de letras para depois fazer a lógica

  for (var j = 0; j < texto.length; j++) {
    var index = alfabeto.indexOf(texto.charAt(j)); //index recebe o valor do index do char na string
    if (index >= 0) {
      cripto += alfabeto.charAt((index + k) % 26); //valor asc+shift % nº de letras no alfabeto
    } else {
      cripto += texto.charAt(j);
    }
  }
  $('#mensagem').html(cripto);
});