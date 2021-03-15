window.onload = function () {
    document.getElementById("download").addEventListener("click", () => {
        const invoice = this.document.getElementById("invoice");
        const none = this.document.getElementById("none").hidden = true;
        const vide = this.document.getElementById("vide").hidden = true;
        const disparu = this.document.getElementById("disparu").hidden = true;
        const empty = this.document.getElementById("empty").hidden = true;
        console.log(invoice);
        console.log(none);
        console.log(vide);
        console.log(disparu);
        console.log(empty);
        console.log(window);
        var opt = {
            margin: 1,
            filename: 'monCV.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
        };
        html2pdf().from(invoice).set(opt).save();
        html2pdf().from(none).set(opt).save();
        html2pdf().from(vide).set(opt).save();
        html2pdf().from(disparu).set(opt).save();
        html2pdf().from(empty).set(opt).save();
    })
}
