/// @description Ini Owner

// inherent the parent event
event_inherited();

// Owner
owner = -4; // this is the actual owner of this object
secret_owner = -4; // this determains who is the actual controller of this node
apparent_owner[0] = -4; // this is the owner that diffrent owners see as the one controlling this object
original_owner = -4; // this var is set by the script creating this object
delta_owner = owner; // switch type var