/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_4290765941")

  // update field
  collection.fields.addAt(1, new Field({
    "hidden": false,
    "id": "file2729472648",
    "maxSelect": 99,
    "maxSize": 0,
    "mimeTypes": [],
    "name": "documents",
    "presentable": false,
    "protected": false,
    "required": false,
    "system": false,
    "thumbs": [],
    "type": "file"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_4290765941")

  // update field
  collection.fields.addAt(1, new Field({
    "hidden": false,
    "id": "file2729472648",
    "maxSelect": 1,
    "maxSize": 0,
    "mimeTypes": [],
    "name": "documents",
    "presentable": false,
    "protected": false,
    "required": false,
    "system": false,
    "thumbs": [],
    "type": "file"
  }))

  return app.save(collection)
})
