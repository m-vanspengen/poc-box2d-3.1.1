#include <SDL3/SDL.h>
#include <box2d/box2d.h>
#include <iostream>
#include <iomanip>
#include <vector>

// --- Screen and Scaling Constants ---
const int SCREEN_WIDTH = 800;
const int SCREEN_HEIGHT = 600;
const float PIXELS_PER_METER = 20.0f;

// --- Main Application ---
int main(int argc, char* argv[])
{
	// 1. Initialize SDL
	if (SDL_Init(SDL_INIT_VIDEO) < 0) {
		std::cerr << "Could not initialize SDL: " << SDL_GetError() << std::endl;
		return 1;
	}

	SDL_Window* window = SDL_CreateWindow("Box2D Simulation - It Works!", SCREEN_WIDTH, SCREEN_HEIGHT, 0);
	if (!window) {
		std::cerr << "Could not create window: " << SDL_GetError() << std::endl;
		SDL_Quit();
		return 1;
	}

	SDL_Renderer* renderer = SDL_CreateRenderer(window, nullptr);
	if (!renderer) {
		std::cerr << "Could not create renderer: " << SDL_GetError() << std::endl;
		SDL_DestroyWindow(window);
		SDL_Quit();
		return 1;
	}

	// 2. Initialize Box2D
	b2WorldDef worldDef = b2DefaultWorldDef();
	worldDef.gravity = { 0.0f, -10.0f };
	b2WorldId worldId = b2CreateWorld(&worldDef);

	// Ground Body
	b2BodyDef groundBodyDef = b2DefaultBodyDef();
	groundBodyDef.position = { 0.0f, -10.0f };
	b2BodyId groundId = b2CreateBody(worldId, &groundBodyDef);
	b2Polygon groundBox = b2MakeBox(50.0f, 10.0f);
	b2ShapeDef groundShapeDef = b2DefaultShapeDef();
	b2CreatePolygonShape(groundId, &groundShapeDef, &groundBox);

	// Dynamic Body
	b2BodyDef bodyDef = b2DefaultBodyDef();
	bodyDef.type = b2_dynamicBody;
	bodyDef.position = { 0.0f, 10.0f };
	b2BodyId bodyId = b2CreateBody(worldId, &bodyDef);
	b2Polygon dynamicBox = b2MakeBox(1.0f, 1.0f);
	b2ShapeDef shapeDef = b2DefaultShapeDef();
	shapeDef.density = 1.0f;
	shapeDef.material.friction = 0.3f;
	b2CreatePolygonShape(bodyId, &shapeDef, &dynamicBox);

	// 3. Main Application Loop with Timing Control
	bool quit = false;
	SDL_Event e;

	// Timing variables for a fixed timestep
	float timeStep = 1.0f / 60.0f; // Run physics at 60 steps per second
	int subStepCount = 4;
	float accumulator = 0.0f;
	Uint64 currentTime = SDL_GetPerformanceCounter();

	while (!quit) {
		// Calculate time elapsed since the last frame (delta time)
		Uint64 newTime = SDL_GetPerformanceCounter();
		float frameTime = (float)(newTime - currentTime) / (float)SDL_GetPerformanceFrequency();
		currentTime = newTime;

		// Add the frame time to an accumulator.
		// This prevents "jitter" and keeps physics smooth.
		accumulator += frameTime;

		// Event Handling
		while (SDL_PollEvent(&e) != 0) {
			if (e.type == SDL_EVENT_QUIT) {
				quit = true;
			}
		}

		// Physics Step
		// While the accumulated time is enough for one or more physics steps,
		// update the simulation.
		while (accumulator >= timeStep)
		{
			b2World_Step(worldId, timeStep, subStepCount);
			accumulator -= timeStep;
		}

		// Rendering
		SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255);
		SDL_RenderClear(renderer);

		// Draw the Ground
		b2Transform groundTransform = b2Body_GetTransform(groundId);
		float groundWidth = 50.0f * 2.0f * PIXELS_PER_METER;
		float groundHeight = 10.0f * 2.0f * PIXELS_PER_METER;
		float groundScreenX = (SCREEN_WIDTH / 2.0f) + (groundTransform.p.x * PIXELS_PER_METER) - (groundWidth / 2.0f);
		float groundScreenY = (SCREEN_HEIGHT / 2.0f) - (groundTransform.p.y * PIXELS_PER_METER) - (groundHeight / 2.0f);
		SDL_FRect groundRect = { groundScreenX, groundScreenY, groundWidth, groundHeight };
		SDL_SetRenderDrawColor(renderer, 0, 128, 0, 255);
		SDL_RenderFillRect(renderer, &groundRect);

		// Draw the Dynamic Box
		b2Transform boxTransform = b2Body_GetTransform(bodyId);
		float hx = 1.0f;
		float hy = 1.0f;
		b2Vec2 vertices[4] = { {-hx, -hy}, {hx, -hy}, {hx, hy}, {-hx, hy} };
		SDL_Vertex sdlVertices[4];
		for (int i = 0; i < 4; ++i) {
			b2Vec2 world_v = b2TransformPoint(boxTransform, vertices[i]);
			float screenX = (SCREEN_WIDTH / 2.0f) + (world_v.x * PIXELS_PER_METER);
			float screenY = (SCREEN_HEIGHT / 2.0f) - (world_v.y * PIXELS_PER_METER);
			sdlVertices[i].position = { screenX, screenY };
			sdlVertices[i].color = { 255, 0, 0, 255 };
			sdlVertices[i].tex_coord = { 0, 0 };
		}
		int indices[] = { 0, 1, 2, 0, 2, 3 };
		SDL_RenderGeometry(renderer, nullptr, sdlVertices, 4, indices, 6);

		SDL_RenderPresent(renderer);
	}

	// 4. Cleanup
	b2DestroyWorld(worldId);
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();

	return 0;
}