sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiorielemordermonitor/test/integration/FirstJourney',
		'fiorielemordermonitor/test/integration/pages/OrdersList',
		'fiorielemordermonitor/test/integration/pages/OrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrdersList, OrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiorielemordermonitor') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrdersList: OrdersList,
					onTheOrdersObjectPage: OrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);