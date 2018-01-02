///scr_node_remove()

// This scipt removes a node from the global node array

globalvar node;

var l = array_height_2d(node);

for( var i = 0; i<l; i++ )
{	
	if( node[i,0] == id) 
	{
		node[i,0] = -5;
		break;
	}
}