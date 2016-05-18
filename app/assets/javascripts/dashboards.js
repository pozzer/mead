if (window.mead_project === undefined) window.mead_project = {};

mead_project.dashboards = {
    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
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
        var $chartPolarPieDonutData = [
            {
                value: 56,
                color: 'rgba(171, 227, 125, 1)',
                highlight: 'rgba(171, 227, 125, .75)',
                label: 'Earnings'
            },
            {
                value: 22,
                color: 'rgba(250, 219, 125, 1)',
                highlight: 'rgba(250, 219, 125, .75)',
                label: 'Sales'
            },
            {
                value: 22,
                color: 'rgba(117, 176, 235, 1)',
                highlight: 'rgba(117, 176, 235, .75)',
                label: 'Tickets'
            }
        ];

        // Init Charts
        $chartLines = new Chart($chartLinesCon).Line($chartLinesBarsRadarData, $globalOptions);
        $chartBars  = new Chart($chartBarsCon).Bar($chartLinesBarsRadarData, $globalOptions);
        $chartPie   = new Chart($chartPieCon).Pie($chartPolarPieDonutData, $globalOptions);
        $chartDonut = new Chart($chartDonutCon).Doughnut($chartPolarPieDonutData, $globalOptions);
        }
        return pub;
    }()
};
mead_project.dashboards.index = mead_project.dashboards.search = mead_project.dashboards.update =
    mead_project.dashboards.create = mead_project.dashboards.new = mead_project.dashboards.edit = mead_project.dashboards.common;

