var msgElement, listElement;

//onloadイベントハンドラを追加
if (window.addEventListener) {
    window.addEventListener("load", onLoad, false);
}
else if (window.attachEvent) {
    window.attachEvent("onload", onLoad);
}
else {
    window.onload = onLoad;
}

//onloadイベントハンドラ
function onLoad() {
    msgElement = document.getElementById("ResultLabel");
    listElement = document.getElementById("PackageSizeList");

    if (window.addEventListener) {
        listElement.addEventListener("change", onChange, false);
    }
    else if (window.attachEvent) {
        listElement.attachEvent("onchange", onChange);
    }
    else {
        listElement.onchange = onChange;
    }
}

//リストのonchangeイベントハンドラ
function onChange() {
    if (listElement.value == "0") {
        msgElement.innerHTML = "";
        return;
    }

    msgElement.innerHTML = "読み込み中...";

    //サーバーのメソッドを呼び出す
    callbackServer(listElement.value, "");
}

//サーバーが返したデータを取得するイベントハンドラ
function receiveServerData(arg, contet) {
    msgElement.innerHTML = "料金は" + arg + "円";
}

//サーバーでエラーが発生したときに結果を取得するイベントハンドラ
function callbackError(arg, context) {
    msgElement.innerHTML = "エラーが発生しました";
}