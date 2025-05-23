CREATE TABLE `maintenance_records` (
	`id` text PRIMARY KEY NOT NULL,
	`motorcycle_id` text NOT NULL,
	`task_id` text,
	`date` integer NOT NULL,
	`mileage` integer,
	`cost` real,
	`notes` text,
	`receipt_url` text,
	`is_scheduled` integer DEFAULT true,
	`resets_interval` integer DEFAULT true,
	`next_due_odometer` integer,
	`next_due_date` integer,
	`created_at` integer DEFAULT '"2025-05-05T16:24:10.873Z"' NOT NULL,
	FOREIGN KEY (`motorcycle_id`) REFERENCES `motorcycles`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`task_id`) REFERENCES `maintenance_tasks`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `maintenance_tasks` (
	`id` text PRIMARY KEY NOT NULL,
	`motorcycle_id` text NOT NULL,
	`name` text NOT NULL,
	`description` text,
	`interval_miles` integer,
	`interval_days` integer,
	`base_odometer` integer,
	`next_due_odometer` integer,
	`base_date` integer,
	`next_due_date` integer,
	`priority` text DEFAULT 'medium',
	`is_recurring` integer DEFAULT true,
	`archived` integer DEFAULT false,
	`created_at` integer DEFAULT '"2025-05-05T16:24:10.873Z"' NOT NULL,
	FOREIGN KEY (`motorcycle_id`) REFERENCES `motorcycles`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `motorcycles` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`name` text NOT NULL,
	`make` text NOT NULL,
	`model` text NOT NULL,
	`year` integer NOT NULL,
	`purchase_date` integer,
	`current_mileage` integer,
	`vin` text,
	`color` text,
	`image_url` text,
	`notes` text,
	`created_at` integer DEFAULT '"2025-05-05T16:24:10.872Z"' NOT NULL,
	`updated_at` integer DEFAULT '"2025-05-05T16:24:10.873Z"' NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`email` text NOT NULL,
	`password` text,
	`created_at` integer DEFAULT '"2025-05-05T16:24:10.872Z"' NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);