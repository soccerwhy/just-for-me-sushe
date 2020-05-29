<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2020/2/7
  Time: 上午10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Beautiful-Echarts</title>
    <script src="echarts.common.min.js"></script>
    <script type="text/javascript"
            src="jquery-3.2.1.js"></script>
</head>
<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 800px; height: 600px;"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var url = '/example/echart';
    $.getJSON(url).done(function(json) {
        var jsonObj = eval(json);
        var scale = 1;
        var echartData = jsonObj;
        //alert("echartDate:" + echartData);
//        var echartsData = [{
//            value: 2154,
//            name: '曲阜师范大学'
//        }, {
//            value: 3854,
//            name: '潍坊学院'
//        }, {
//            value: 3515,
//            name: '青岛职业技术学院'
//        }, {
//            value: 3515,
//            name: '淄博师范高等专科'
//        }, {
//            value: 3854,
//            name: '鲁东大学'
//        }, {
//            value: 2154,
//            name: '山东师范大学'
//        }]
       // alert("ecahrtsData: " + echartsData);
        var rich = {
            yellow: {
                color: "#ffc72b",
                fontSize: 30 * scale,
                padding: [5, 4],
                align: 'center'
            },
            total: {
                color: "#ffc72b",
                fontSize: 40 * scale,
                align: 'center'
            },
            white: {
                color: "#000000",
                align: 'center',
                fontSize: 14 * scale,
                padding: [21, 0]
            },
            blue: {
                color: '#49dff0',
                fontSize: 16 * scale,
                align: 'center'
            },
            hr: {
                borderColor: '#0b5263',
                width: '100%',
                borderWidth: 1,
                height: 0,
            }
        }
        option = {
            backgroundColor: '#ffffff',
            title: {
                text:'总搜索数',
                left:'center',
                top:'53%',
                padding:[24,0],
                textStyle:{
                    color:'#000000',
                    fontSize:18*scale,
                    align:'center'
                }
            },
            legend: {
                selectedMode:false,
                formatter: function(name) {
                    var total = 0; //各科正确率总和
                    var averagePercent; //综合正确率
                    echartData.forEach(function(value, index, array) {
                        total += value.value;
                    });
                    return '{total|' + total + '}';
                },
                data: [echartData[0].name],
                // data: ['高等教育学'],
                // itemGap: 50,
                left: 'center',
                top: 'center',
                icon: 'none',
                align:'center',
                textStyle: {
                    color: "#000000",
                    fontSize: 16 * scale,
                    rich: rich
                },
            },
            series: [{
                name: '总考生数量',
                type: 'pie',
                radius: ['42%', '50%'],
                hoverAnimation: false,
                color: ['#c487ee', '#deb140', '#49dff0', '#034079', '#6f81da', '#00ffb4'],
                label: {
                    normal: {
                        formatter: function(params, ticket, callback) {
                            var total = 0; //考生总数量
                            var percent = 0; //考生占比
                            echartData.forEach(function(value, index, array) {
                                total += value.value;
//                                total += value.age;

                            });
                            percent = ((params.value / total) * 100).toFixed(1);
//                            percent = ((params.value / total) * 100).toFixed(1);
//                            return '{white|' + params.name + '}\n{hr|}\n{yellow|' + params.value + '}\n{blue|' + percent + '%}';

                            return '{white|' + params.name + '}\n{hr|}\n{yellow|' + params.value + '}\n{blue|' + percent + '%}';
                        },
                        rich: rich
                    },
                },
                labelLine: {
                    normal: {
                        length: 55 * scale,
                        length2: 0,
                        lineStyle: {
                            color: '#0b5263'
                        }
                    }
                },
                data: echartData
            }]
        };
        myChart.setOption(option);
    })





</script>


</body>
</html>
