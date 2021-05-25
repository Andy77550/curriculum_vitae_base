
window.onload = function () {
    document.getElementById("download").addEventListener("click", () => {
        const invoice = this.document.getElementById("invoice");
        const none = this.document.getElementById("none").hidden = true;
        const vide_form_add = this.document.getElementById("vide_form_add").hidden = true;
        var btncache = this.document.getElementsByClassName("btncache");

        for (var i = 0; i < btncache.length; i ++) {
            btncache[i].style.display = 'none';
        }
            
        console.log(invoice);
        console.log(none);
        console.log(vide_form_add);
        console.log(btncache);
        console.log(window);
            var opt = {
                margin: 0,
                filename: 'monCV.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
        html2pdf().from(invoice).set(opt).save();
        html2pdf().from(none).set(opt).save();
        html2pdf().from(vide_form_add).set(opt).save();
        html2pdf().from(btncache).set(opt).save();

        setTimeout(() => { document.location.reload();}, 500);

    })
}
