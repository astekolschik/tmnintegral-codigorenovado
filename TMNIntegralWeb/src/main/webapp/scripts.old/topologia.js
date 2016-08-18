function mostrarTopologiaConImagenes(topologia) {

	var DIR = window.location.pathname +  '/../images/topologia/';
	
    var EDGE_LENGTH_MAIN = 150;
    var EDGE_LENGTH_SUB = 50;

	// Create a data table with nodes.
    nodes = [];

    // Create a data table with links.
    edges = [];
    
    for (var i=0; i<topologia.elements.length; i++){
    	var elmt = topologia.elements[i];
    	elmt.shape = 'image';
    	if (elmt.type == 'equipment')
    		elmt.image = DIR + 'computer.png';
    	else if (elmt.type == 'interface')
    		elmt.image = DIR + 'router.png';
    	nodes.push(elmt);
    }
    
    for (var i=0; i<topologia.links.length; i++){
    	var link = topologia.links[i];
    	if (link.type == 'internal')
    		link.length = EDGE_LENGTH_SUB;
    	else if (link.type == 'external')
    		link.length = EDGE_LENGTH_MAIN;
    	edges.push(link);
    }

    // create a network
    var container = document.getElementById('net-container');
    var data = {
      nodes: nodes,
      edges: edges
    };
    var options = {};
    network = new vis.Network(container, data, options);
}