package main

import "core:fmt"
import "core:strings"
import "core:time"
import rl "vendor:raylib"

main :: proc() {
	this_time := time.weekday(time.time_add(time.now(), time.Hour * 8))


	rl.InitWindow(500, 500, "Weekday")
	defer rl.CloseWindow()

	week_textures: [time.Weekday]rl.Texture
	sunday := #load("./0.png")
	monday := #load("./1.png")
	tuesday := #load("./2.png")
	wednesday := #load("./3.png")
	thursday := #load("./4.png")
	friday := #load("./5.png")
	saturday := #load("./6.png")

	week_textures[.Sunday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(sunday[:]), auto_cast len(sunday[:])),
	)
	week_textures[.Monday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(monday[:]), auto_cast len(monday[:])),
	)
	week_textures[.Tuesday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(tuesday[:]), auto_cast len(tuesday[:])),
	)
	week_textures[.Wednesday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(wednesday[:]), auto_cast len(wednesday[:])),
	)
	week_textures[.Thursday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(thursday[:]), auto_cast len(thursday[:])),
	)
	week_textures[.Friday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(friday[:]), auto_cast len(friday[:])),
	)
	week_textures[.Saturday] = rl.LoadTextureFromImage(
		rl.LoadImageFromMemory(".png", raw_data(saturday[:]), auto_cast len(saturday[:])),
	)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()

		rl.ClearBackground(rl.BLACK)
		rl.DrawTextureEx(week_textures[this_time], {0, 0}, 0, 0.5, rl.WHITE)
	}
}
