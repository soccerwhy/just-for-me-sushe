<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2020/2/7
  Time: 下午7:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="echarts.common.min.js"></script>
    <script type="text/javascript"
            src="jquery-3.2.1.js"></script>
</head>
<body background="">

<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 1300px; height: 600px;"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var url = '/example/echart';
    $.getJSON(url).done(function(json) {
        var jsonObj = eval(json);
        var scale = 1;
        var echartData = jsonObj;
        var rich = {
            yellow: {
                color: "#ffc72b",
                fontSize: 35 * scale,
                padding: [5, 4],
                align: 'center'
            },
            total: {
                color: "#031f2d",
                fontSize: 0,
                align: 'center'
            },
            white: {
                color: "#fff",
                align: 'center',
                fontSize: 19 * scale,
                padding: [21, 0]
            },
            blue: {
                color: '#49dff0',
                fontSize: 21 * scale,
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
            backgroundColor: '#031f2d',
            title: {
                text:'最热搜索词TOP5',
                left:'center',
                top:'1%',
                padding:[12,12],
                textStyle:{
                    color:'#fff',
                    fontSize:28*scale,
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
                left: 'center',
                top: 'center',
                icon: 'none',
                align:'center',
                textStyle: {
                    color: "#fff",
                    fontSize: 16 * scale,
                    rich: rich
                },
            },
            series: [{
                name: '最热搜索词Top10',
                type: 'pie',
                radius: ['36%', '50%'],
                hoverAnimation: true,
                color: ['#c487ee', '#deb140', '#49dff0', '#034079', '#6f81da', '#00ffb4'],
                label: {
                    normal: {
                        formatter: function(params, ticket, callback) {
                            var total = 0; //考生总数量
                            var percent = 0; //考生占比

                            echartData.forEach(function(value, index, array) {
                                total += value.value;

                            });
                            percent = ((params.value / total) * 100).toFixed(1);

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
