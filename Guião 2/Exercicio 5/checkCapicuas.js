checkCapicuas = function() {
    var phones2 = db.phones.find({"_id":0, "display":1}).toArray();
    var numseq = 0;
    for (var i = 0; i < phones2.length; i++) {
        if (isCapicua(phones2[i].display.replace(/\D/g, ""))) {
            numseq++;
        }
    }
    print("Número de Capicuas:", numseq);
}

function isCapicua(num) {
    var str = num.toString();
    var reversedStr = str.split('').reverse().join('');
    return str === reversedStr;
}
