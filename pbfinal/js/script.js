var barData = [120, 230, 160, 140, 200, 90, 180, 50, 300];

var height = 400, 
    width = 600,
    barWidth = 50,
    barOffSet = 5;

d3.select('#barGraph').append('svg')
    .attr('width', width)
    .attr('height', height)
    .style('background', '#a2d2a0')
    .selectAll('rect').data(barData)
    .enter().append('rect')
        .style('fill', '#ffa106')
        .attr('width', barWidth)
        .attr('height', function(data) {
            return data;
        })
        .attr('x', function(data, i) {
            return i * (barWidth + barOffSet);
        })
        .attr('y', function(data) {
            return height - data;
        })
           

/*var yScale = d3.scale.linear()
        .domain([0, d3.max(barData)])
        .range([0, height]);

//var xScale = d3.scale.ordinal() 
//        .domain(d3.range(0, barData.length))
//        .rangeBands([0, width]);


d3.select('#barGraph').append('svg')
    .attr('width', width)
    .attr('height', height)
    .style('background', '#a2d2a0')
    .selectAll('rect').data(barData)
    .enter().append('rect')
        .style('fill', '#ffa106')
        .attr('width', barWidth)
        .attr('height', function(data) {
            return yScale(data);
        })
        .attr('x', function(data, i) {
            return i * (barWidth + barOffSet);
        })
        .attr('y', function(data) {
            return height - yScale(data);
        })*/