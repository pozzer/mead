if (window.mead_project === undefined) window.mead_project = {};

mead_project.dashboards = function() {
    var priv = {};
    var pub = {};
    var $globalOptions = {
            scaleFontFamily: "'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif",
            scaleFontColor: '#999',
            scaleFontStyle: '600',
            tooltipTitleFontFamily: "'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif",
            tooltipCornerRadius: 3,
            maintainAspectRatio: false,
            responsive: true
        };

    pub.render_pie_questions = function(without_best_answer, with_best_answer){
        var $chartPieCon  = jQuery('.js-chartjs-pie-questions')[0].getContext('2d');
        var $chartPie;

        var $chartPolarPieDonutData = [
            {
                value: without_best_answer,
                color: 'rgba(250, 219, 125, 1)',
                highlight: 'rgba(250, 219, 125, .75)',
                label: 'Sem Resposta'
            },
            {
                value: with_best_answer,
                color: 'rgba(171, 227, 125, 1)',
                highlight: 'rgba(171, 227, 125, .75)',
                label: 'Perguntas Respondidas'
            }            
        ];

        $chartPie   = new Chart($chartPieCon).Pie($chartPolarPieDonutData, $globalOptions);

    }

    pub.render_pie_trades = function(started, accepted, in_progress, awaiting_finalization, waiting_to_be_sent, finished, canceled){
        var $chartPieCon  = jQuery('.js-chartjs-pie-trades')[0].getContext('2d');
        var $chartPie;

        var $chartPolarPieDonutData = [
            {
                value: started,
                color: 'rgb(204, 153, 255)',
                highlight: 'rgb(204, 153, 255)',
                label: 'Iniciadas'
            },
            {
                value: accepted,
                color: 'rgb(153, 204, 255)',
                highlight: 'rgb(153, 204, 255)',
                label: 'Aceitas'
            },
            {
                value: in_progress,
                color: 'rgba(250, 219, 125, 1)',
                highlight: 'rgba(250, 219, 125, .75)',
                label: 'Em negociação'
            },
            {
                value: awaiting_finalization,
                color: 'rgb(0, 255, 204)',
                highlight: 'rgb(0, 255, 204)',
                label: 'Sem Resposta'
            },
            {
                value: waiting_to_be_sent,
                color: 'rgb(153, 255, 102)',
                highlight: 'rgb(153, 255, 102)',
                label: 'Aguardando Envios'
            },
            {
                value: finished,
                color: 'rgb(0, 153, 0)',
                highlight: 'rgb(0, 153, 0)',
                label: 'Finalizadas'
            },
            {
                value: canceled,
                color: 'rgb(179, 36, 0)',
                highlight: 'rgb(179, 36, 0)',
                label: 'Canceladas'
            }            
        ];

        $chartPie = new Chart($chartPieCon).Pie($chartPolarPieDonutData, $globalOptions);

    }

    /*    pub.init = function(datas) {
        var $chartLinesCon  = jQuery('.js-chartjs-lines')[0].getContext('2d');
        var $chartBarsCon   = jQuery('.js-chartjs-bars')[0].getContext('2d');
        var $chartPieCon    = jQuery('.js-chartjs-pie')[0].getContext('2d');
        var $chartDonutCon  = jQuery('.js-chartjs-donut')[0].getContext('2d');

        // Set Chart and Chart Data variables
        var $chartLines, $chartBars, $chartRadar, $chartPolar, $chartPie, $chartDonut;
        var $chartLinesBarsRadarData, $chartPolarPieDonutData;

        // Set global chart options
        var $globalOptions = {
            scaleFontFamily: "'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif",
            scaleFontColor: '#999',
            scaleFontStyle: '600',
            tooltipTitleFontFamily: "'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif",
            tooltipCornerRadius: 3,
            maintainAspectRatio: false,
            responsive: true
        };

        // Lines/Bar/Radar Chart Data
        var $chartLinesBarsRadarData = {
            labels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
            datasets: [
                {
                    label: 'Last Week',
                    fillColor: 'rgba(220,220,220,.3)',
                    strokeColor: 'rgba(220,220,220,1)',
                    pointColor: 'rgba(220,220,220,1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: [30, 32, 40, 45, 43, 38, 55]
                },
                {
                    label: 'This Week',
                    fillColor: 'rgba(171, 227, 125, .3)',
                    strokeColor: 'rgba(171, 227, 125, 1)',
                    pointColor: 'rgba(171, 227, 125, 1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(171, 227, 125, 1)',
                    data: [15, 16, 20, 25, 23, 25, 32]
                }
            ]
        };

        // Polar/Pie/Donut Data
        

        // Init Charts
        $chartLines = new Chart($chartLinesCon).Line($chartLinesBarsRadarData, $globalOptions);
        $chartBars  = new Chart($chartBarsCon).Bar($chartLinesBarsRadarData, $globalOptions);
        $chartPie   = new Chart($chartPieCon).Pie($chartPolarPieDonutData, $globalOptions);
        $chartDonut = new Chart($chartDonutCon).Doughnut($chartPolarPieDonutData, $globalOptions);
        }*/
    return pub;
}();
//mead_project.dashboards.index = mead_project.dashboards.search = mead_project.dashboards.update =
  //  mead_project.dashboards.create = mead_project.dashboards.new = mead_project.dashboards.edit = mead_project.dashboards.common;

