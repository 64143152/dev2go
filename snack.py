import tkinter as tk
import random

class SnakeGame:
    def __init__(self, root):
        self.root = root
        self.root.title("Snake Game")

        self.width = 400
        self.height = 400
        self.cell_size = 20

        self.canvas = tk.Canvas(self.root, width=self.width, height=self.height, bg="black")
        self.canvas.pack()

        self.reset_game()

    def reset_game(self):
        self.snake = [(self.width // 2, self.height // 2)]
        self.snake_direction = "Right"
        self.food_position = self.set_new_food_position()
        self.score = 0
        self.game_over_flag = False

        self.root.bind("<KeyPress>", self.change_direction)
        self.game_loop()

        if hasattr(self, 'restart_button'):
            self.restart_button.destroy()

    def set_new_food_position(self):
        while True:
            x = random.randint(0, (self.width // self.cell_size) - 1) * self.cell_size
            y = random.randint(0, (self.height // self.cell_size) - 1) * self.cell_size
            if (x, y) not in self.snake:
                return (x, y)

    def change_direction(self, event):
        key = event.keysym
        if key == 'w' and self.snake_direction != 'Down':
            self.snake_direction = 'Up'
        elif key == 's' and self.snake_direction != 'Up':
            self.snake_direction = 'Down'
        elif key == 'a' and self.snake_direction != 'Right':
            self.snake_direction = 'Left'
        elif key == 'd' and self.snake_direction != 'Left':
            self.snake_direction = 'Right'

    def move_snake(self):
        head_x, head_y = self.snake[0]

        if self.snake_direction == "Up":
            head_y -= self.cell_size
        elif self.snake_direction == "Down":
            head_y += self.cell_size
        elif self.snake_direction == "Left":
            head_x -= self.cell_size
        elif self.snake_direction == "Right":
            head_x += self.cell_size

        new_head = (head_x, head_y)

        # Move the snake
        self.snake = [new_head] + self.snake[:-1]

        # Check if the snake has eaten the food
        if self.snake[0] == self.food_position:
            # Add a new segment to the snake
            self.snake.append(self.snake[-1])
            self.food_position = self.set_new_food_position()
            self.score += 10

        # Check for collisions with walls or itself
        if not 0 <= head_x < self.width or not 0 <= head_y < self.height or new_head in self.snake[1:]:
            self.game_over()

    def game_loop(self):
        if self.game_over_flag:
            return

        self.canvas.delete(tk.ALL)

        self.move_snake()

        self.canvas.create_rectangle(0, 0, self.width, self.height, outline="white")
        for x, y in self.snake:
            self.canvas.create_rectangle(x, y, x + self.cell_size, y + self.cell_size, fill="green")

        food_x, food_y = self.food_position
        self.canvas.create_rectangle(food_x, food_y, food_x + self.cell_size, food_y + self.cell_size, fill="red")

        self.canvas.create_text(50, 10, text=f"Score: {self.score}", fill="white", font=('Arial', 14))

        self.root.after(100, self.game_loop)

    def game_over(self):
        self.game_over_flag = True
        self.canvas.delete(tk.ALL)
        self.canvas.create_text(self.width // 2, self.height // 2, text="GAME OVER", fill="red", font=('Arial', 30))
        self.canvas.create_text(self.width // 2, self.height // 2 + 30, text=f"Score: {self.score}", fill="white", font=('Arial', 20))
        
        self.restart_button = tk.Button(self.root, text="Start New Game", command=self.reset_game, font=('Arial', 14))
        self.restart_button.pack(pady=20)

if __name__ == "__main__":
    root = tk.Tk()
    game = SnakeGame(root)
    root.mainloop()
