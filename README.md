 # PureSight Demo

The PureSight demo showcases an example usage of StreamX as a complete web solution. It consists of the following data sources:

- **WebSight CMS**: Provides content management capabilities.
- **PureSight PIM**: Acts as a source of product information.
- **Bash scripts**: Simulate a source of pricing data.

The **StreamX Mesh** is built using StreamX core components. These components provide essential functionalities such as:

- Rendering engine
- Sitemap generator
- Web server
- Search service
- Other services

This setup enables the following capabilities:

- **Rendering HTML pages**
- **Generating Product Detail Pages (PDPs)**
- **Building a `sitemap.xml` file**
- **Exposing product data in JSON format for headless solutions**
- **Generating product listings**
- **Indexing and enabling search functionality**

The PureSight demo allows you to see each of these elements in action in real-time.


## Running PureSight demo

### Run StreamX using [CLI](https://www.streamx.dev/guides/streamx-command-line-interface-reference.html)

Note: tested with CLI version using StreamX 1.0.1

Start mesh defined in `mesh.yml`:

```
streamx run -f mesh.yml
```

Wait till completed.

### Run demo PIM

Start PIM:

```
sh scripts/run-pim.sh
```

### Run WebSight CMS

```
sh scripts/run-websight.sh
```

### Create domain in hosts

```bash
sudo sh -c 'echo "127.0.0.1 streamx.demo" >> /etc/hosts'
```

### Verify the setup
Visit http://streamx.demo/homepage.html. Web server will serve 404 until some data is populated into the StreamX

Demo PIM is available at wsadmin/wsadmin http://localhost:9000/#/login
WebSight 

WebSight is available at wsadmin/wsadmin http://localhost:9001/

## Ingest data

### WebSight CMS
1. Go to http://localhost:9001/apps/groovy#/etc/groovy-console/puresight/publish-components.groovy and click "Run" button. 
This will ingest some components renderers together with configurations needed for dynamic components that are currently not managed by CMS.
2. Visit http://localhost:9001/apps/websight/index.html/content/puresight/pages and publish all the pages from the list (also publish pages from the subtree)
3. On the left hand side switch to assets mode and publish all assets

### PureSight PIM
Visit http://localhost:9000 and click "Sync All" button

### Prices 
You can change the prices of any product passing product id and requested price: 
```
sh scripts/prices/publish-price.sh B071FMSYNH 994
```

### Product reviews
You can also add some reviews for the product:
```
sh scripts/reviews/publish.sh B071FMSYNH
```