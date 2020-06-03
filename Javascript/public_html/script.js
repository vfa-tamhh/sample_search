$(function () {
    var ncmb = new NCMB("b2ee91d471db6e2505ac46e19a4bb594128403067237bda7ce29e232aeb9e77f", "1005a095286c018632636d8db9e0092490a67c7b6a94a1ab868a9c082f30b567");
    var inresult, inarrayresult;

    var SearchClass = ncmb.DataStore("SearchClass");
    var searchArray = ["name5", "name2"];
    $(document).on('click', '#btn-in', function () {
        $('#loading').show();
        SearchClass.in("name", searchArray).fetchAll()
                .then(function (results) {
                    console.log(JSON.stringify(results));
                    inresult = JSON.stringify(results);
                    $('#area-result').text(inresult);
                    $('#loading').hide();
                    var dataset = [];
                    for (var i =0; i< results.length; i++) {
                        var datarow = [];
                        datarow.push(results[i].objectId);
                        datarow.push(results[i].name);
                        datarow.push(results[i].createDate);
                        datarow.push(results[i].updateDate);
                        dataset.push(datarow);
                    }
                    $('#result1').DataTable( {
                        data: dataset,
                        columns: [
                            { title: "objectId" },
                            { title: "name" },
                            { title: "createDate" },
                            { title: "updateDate" }
                        ]
                    } );
                })
                .catch(function (err) {
                    $('#area-result').text(JSON.stringify(err));
                    console.log(err);
                    $('#loading').hide();
                });
    });
    $(document).on('click', '#btn-in-array', function () {
        $('#loading').show();
        SearchClass.inArray("name", searchArray).fetchAll()
                .then(function (results) {
                    console.log(results);
                    inarrayresult = JSON.stringify(results);
                    $('#area-result-array').text(inarrayresult);
                    $('#loading').hide();
                    var dataset = [];
                    for (var i =0; i< results.length; i++) {
                        var datarow = [];
                        datarow.push(results[i].objectId);
                        datarow.push(results[i].name);
                        datarow.push(results[i].createDate);
                        datarow.push(results[i].updateDate);
                        dataset.push(datarow);
                    }
                    $('#result2').DataTable( {
                        data: dataset,
                        columns: [
                            { title: "objectId" },
                            { title: "name" },
                            { title: "createDate" },
                            { title: "updateDate" }
                        ]
                    } );
                })
                .catch(function (err) {
                    console.log(err);
                    $('#area-result-array').text(JSON.stringify(err));
                    $('#loading').hide();
                });
    });
    $(document).on('click', '#btn-compare', function () {
        $('#loading').show();
        if (inresult === inarrayresult) {
            $('#area-result-compare').text("The result is the same.");
        } else {
            $('#area-result-compare').text("The result is NOT the same.");
        }
        $('#loading').hide();
    });
});