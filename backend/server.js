const express = require("express");
const { Pool } = require("pg");
const app = express();


app.use(express.json());

const db = new Pool
({
	host: "db",
	user: "postgres",
	password: "postgres",
	database: "ski_rental",
	port: 5432
});

app.get("/api/:type", async (req, res) =>
{
	const	{type} = req.params;

	const	result = await db.query(`SELECT * FROM ${type} ORDER BY id`);
	res.json(result.rows);
});


app.post("/api/reserve/:type/:id", async (req, res) =>
{
	const { type, id } = req.params;

	const allowed =
	[
		"skis",
		"chaussures",
		"batons"
	];

	if (!allowed.includes(type))
	{
		return res.status(400).json({error: "invalid type"});
	}

	try
	{
		const result = await db.query(`SELECT * FROM ${type} WHERE id = $1`, [id]);

		const item = result.rows[0];

		if (!item)
			return res.status(404).json({error: "not found"});

		if (item.stock <= 0)
			return res.status(400).json({error: "out of stock"});

		await db.query(`UPDATE ${type} SET stock = stock - 1 WHERE id = $1`, [id]);
		clientId++;
		res.json({success: true});
	}
	catch (err)
	{
		console.error(err);

		res.status(500).json({error: "server error"});
	}
});

app.listen(3000, () =>
{
	console.log("backend running");
});