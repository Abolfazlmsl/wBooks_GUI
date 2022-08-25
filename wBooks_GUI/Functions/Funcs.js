function listModelSort(listModel, compareFunction1, compareFunction2, compareFunction3) {
    let indexes = [ ...Array(listModel.count).keys() ]

    indexes.sort(function (a, b) {

        if (compareFunction1(listModel.get(a), listModel.get(b)) < 0){return -1}
        else if (compareFunction1(listModel.get(a), listModel.get(b)) > 0){return 1}
        else{
            if (compareFunction2(listModel.get(a), listModel.get(b)) < 0){return -1}
            else if (compareFunction2(listModel.get(a), listModel.get(b)) > 0){return 1}
            else{
                if (compareFunction3(listModel.get(a), listModel.get(b)) < 0){return -1}
                else if (compareFunction3(listModel.get(a), listModel.get(b)) > 0){return 1}
                else{return 0}
            }
        }

    })

    let sorted = 0
    while (sorted < indexes.length && sorted === indexes[sorted]) sorted++
    if (sorted === indexes.length) return
    for (let i = sorted; i < indexes.length; i++) {
        listModel.move(indexes[i], listModel.count - 1, 1)
        listModel.insert(indexes[i], { })
    }
    listModel.remove(sorted, indexes.length - sorted)
}

function numberWithCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function getRandomNumber(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function remainingLicenseTime(expiredTime){
    var today = new Date();
    var expiredTimeDate = new Date(expiredTime)
    var milisec_diff = expiredTimeDate - today;

    var days = Math.floor(milisec_diff / 1000 / 60 / (60 * 24));

    return days;

    //        print(days + " Days "+ date_diff.getHours() + " Hours " + date_diff.getMinutes() + " Minutes " + date_diff.getSeconds() + " Seconds")
}

function computeDate(time) {
    var date = new Date();
    date.setDate(date.getDate() + time);
    return date.toString();
}
