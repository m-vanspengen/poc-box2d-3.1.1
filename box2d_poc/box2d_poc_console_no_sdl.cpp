#include <box2d/box2d.h> 
#include <iostream>
#include <iomanip>
int main(int argc, char* argv[])
{
	// temp world definition with default values
	b2WorldDef worldDef = b2DefaultWorldDef();
	// set gravity
	worldDef.gravity = { 0.0f, -10.0f };
	// create b2d world
	b2WorldId worldId = b2CreateWorld(&worldDef);
	// world is now created with values from world def, so world def can safely go out of scope
	// default body def for ground in this case
	b2BodyDef groundBodyDef = b2DefaultBodyDef();
	// give the body a position
	groundBodyDef.position = { 0.0f, -10.0f };
	// create body from its def just like with the world (note: to create a body you need the worldId, it is small thus cbv)
	b2BodyId groundId = b2CreateBody(worldId, &groundBodyDef);
	// make ground into box for ground
	b2Polygon groundBox = b2MakeBox(50.0f, 10.0f);
	// create temp shape def
	b2ShapeDef groundShapeDef = b2DefaultShapeDef();
	// create final shape
	b2CreatePolygonShape(groundId, &groundShapeDef, &groundBox); // note: again id is cbv
	// create dynamic body
	b2BodyDef bodyDef = b2DefaultBodyDef();
	bodyDef.type = b2_dynamicBody; // important, specify type for body to be dynamic. defaults to static otherwise
	bodyDef.position = { 0.0f, 4.0f };
	b2BodyId bodyId = b2CreateBody(worldId, &bodyDef);
	b2Polygon dynamicBox = b2MakeBox(1.0f, 1.0f);
	// create shape for body
	b2ShapeDef shapeDef = b2DefaultShapeDef();
	shapeDef.density = 1.0f; // dynamic body must have a density for box2d to work, although setting it to 1.0 is optional since its also the default
	shapeDef.material.friction = 0.3f;
	// add shape to body. when this happens mass is calculated by box2d
	b2CreatePolygonShape(bodyId, &shapeDef, &dynamicBox);
	// simulate world
	float timeStep = 1.0f / 60.0f;
	int subStepCount = 4;
	// simulation loop
	for (int i = 0; i < 90; ++i)
	{
		b2World_Step(worldId, timeStep, subStepCount);
		b2Vec2 position = b2Body_GetPosition(bodyId);
		b2Rot rotation = b2Body_GetRotation(bodyId);
		std::cout << std::fixed << std::setprecision(2)
			<< std::setw(4) << position.x << " "
			<< std::setw(4) << position.y << " "
			<< std::setw(4) << b2Rot_GetAngle(rotation) << "\n";
	}
	b2DestroyWorld(worldId);
}