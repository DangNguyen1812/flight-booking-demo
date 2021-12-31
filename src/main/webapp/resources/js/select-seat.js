/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function createTableSeat(row, col) {
    for (var i = 0; i <= row; i++) {
        var div1 = document.createElement('div');
        div1.className = "aircraft-row";
        document.querySelector('.aircraft-row-body-left').appendChild(div1);
    }
    var aircraftRowElement = Array.from(document.querySelectorAll('.aircraft-row'));
    aircraftRowElement.forEach(function (item, index) {

        for (var j = 0; j < col; j++) {
            if (index === 0) {
                item.classList.add('aircraft-row-sticky');
                if (j === 3) {
                    var div = document.createElement('div');
                    div.className = "aircraft-iden-position";
                    div.innerHTML = "";
                    item.appendChild(div);
                }
                var div = document.createElement('div');
                div.className = "aircraft-iden-position";
                div.innerHTML = (j + 10).toString(36).toUpperCase();
                item.appendChild(div);


            } else {
                if (j === 3) {
                    var div = document.createElement('div');
                    div.className = "aircraft-iden-position";
                    div.innerHTML = index;
                    item.appendChild(div);
                }
                var div = document.createElement('div');
                div.setAttribute("id", index + (j + 10).toString(36).toUpperCase());
                div.setAttribute("class", "seat-all");
                var iconElement = '<i class="fas fa-bread-slice icon-chair"></i>';

                var htmls = [];
                htmls.push(iconElement);
                div.innerHTML = htmls.join('');
                item.appendChild(div);
            }

        }
    });
}
;

