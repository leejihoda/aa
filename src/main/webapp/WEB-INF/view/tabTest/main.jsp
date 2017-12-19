<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery UI Tabs - Simple manipulation</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        #dialog label, #dialog input { display:block; }
        #dialog label { margin-top: 0.5em; }
        #dialog input, #dialog textarea { width: 95%; }
        #tabs { margin-top: 1em; }
        #tabs li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
        #add_tab { cursor: pointer; }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        var listData = $('#tabs').find('a');;
        $(function(){
            var localDataOrg = JSON.parse(localStorage.getItem('localData'));
            console.log(localDataOrg);

            var tabTemplate = '<li><a href="#href" data-url="#url">#label</a> <span class="ui-icon ui-icon-close" role="presentation">Remove Tab</span></li>';
            var tabCounter = 2;
            var tabs = $('#tabs').tabs();

            if(localDataOrg !== null && localDataOrg.length > 0){
                for (var l=0;l<localDataOrg.length;l++) {
                    addTab(localDataOrg[l].url,localDataOrg[l].title,localDataOrg[l].active);
                }
            }

            function addTab(URL,TITLE,ACTIVE) {
                var check = true;
                var checkId = '';

                if(listData.length > 0){
                    for (var l=0;l<listData.length;l++) {
                        if($(listData).eq(l).text() === TITLE){
                            check = false;
                            checkId = $(listData).eq(l).attr('href');
                        }
                    }
                }
                if(check){
                    var label = TITLE;
                    var id = 'tabs-' + tabCounter;
                    checkId = '#' + id;
                    var li = $( tabTemplate.replace( /#href/g, checkId).replace( /#label/g, label ).replace( /#url/g, URL ) );
                    tabs.find('.ui-tabs-nav').append(li);
                    tabs.append('<div id="'+id+'"> <iframe src="'+URL+'" width="100%" height="500px" frameborder="0"></iframe></div>');
                    tabs.tabs('refresh');
                    tabCounter++;
                }

                listData = $('#tabs').find('a');
                for (var l=0;l<listData.length;l++) {
                    if($(listData).eq(l).attr('href') === checkId){
                        if(ACTIVE){
                            $(listData).eq(l).trigger('click');
                        }
                    }
                }
                setStrorageData();
            }

            $(document).on('click','#tabs > ul > li ',function(){
                setStrorageData();
            });

            $('.add_tab').on('click',function(){
                addTab($(this).data('url'),$(this).text(),true);
            });

            tabs.on( 'click', 'span.ui-icon-close', function() {
                var panelId = $( this ).closest( 'li' ).remove().attr( 'aria-controls' );
                $( '#' + panelId ).remove();
                tabs.tabs('refresh');
                setStrorageData();
            });

            function setStrorageData(){
                var localData = new Array();
                listData = $('#tabs').find('a');
                for (var l=0;l<listData.length;l++) {
                    var obj = new Object();
                    obj.url = $(listData).eq(l).data('url');
                    obj.title = $(listData).eq(l).text();
                    obj.display_order = l;
                    if($(listData).parent().eq(l).hasClass('ui-state-active')){
                        obj.active = true;
                    }else{
                        obj.active = false;
                    }
                    localData.push(obj)
                }
                localStorage.setItem('localData',JSON.stringify(localData));
            }


        });


        $(document).keydown(function(e) {
            if (e.ctrlKey === true && ( e.keyCode === 78 || e.keyCode === 82 ) || e.keyCode === 116) {
                alert('새로고침 방지');
                event.keyCode = 0;
                event.cancelBubble = true;
                event.returnValue = false;
            }
        });



    </script>
</head>
<body>
<div style="width:10%;float:left;">
    <ul>
        <li><a class="add_tab" href="javascript:void(0);" data-url="http://localhost:8080/tabTest/list/ex1/page/" >도메인 설정</a></li>
        <li><a class="add_tab" href="javascript:void(0);" data-url="http://localhost:8080/tabTest/list/ex2/page/" >도메인 일별 통계</a></li>
        <li><a class="add_tab" href="javascript:void(0);" data-url="http://localhost:8080/tabTest/list/ex3/page/" >도메인 월별 통계</a></li>
    </ul>
</div>
<div style="width:90%;float:left;">
    <div id="tabs">
        <ul></ul>
    </div>

</div>
</body>
</html>