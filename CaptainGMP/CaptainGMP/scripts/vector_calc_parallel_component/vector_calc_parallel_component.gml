/// @description vector_subtract(momentArm, myForce);
/// @param momentArm
/// @param myForce

return vector_multiply(argument[0],  (vector_dot(argument[1], argument[0]) / vector_dot(argument[0], argument[0])));