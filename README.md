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

Start mesh defined in `mesh.yaml`:

```
streamx run -f mesh.yaml
```

Wait till completed.

### Run demo PIM

Start PIM:

```bash
sh scripts/run-pim.sh
```

### Run WebSight CMS

```bash
sh scripts/run-websight.sh
```

### Verify the setup
Visit http://puresight.demo.127.0.0.1.nip.io/homepage.html. Web server will serve 404 until some data is populated into the StreamX

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

# Sample demo scenario

## Part I - Dynamic Data in CMS Components

### Presented Capabilities
- CMS Sites with real-time components at the speed and scale of cached content.
- Pre-rendered experiences that always reflect the latest changes in source systems.

#### Orient the Audience to the Screen
1. Present the homepage as it is and explain the dynamic component with a product listing.
2. Present a sample product page and explain that it is generated based on a page template from CMS and data from the PIM and pricing system.

#### Scenario
1. Open the CMS and edit the product listing component on the homepage.
    - Set the category to **Accent Furniture** and publish the page.
2. Publish the price **(99)** for product `B075X5TN2K`.
3. Refresh the homepage.

#### Explain What Happened in the Background
- The price update triggered regeneration of the product.
- **StreamX** regenerated the page fragment with the list of products in the "Accent Furniture" category (sorted by price, cheapest first).
- The homepage was requested.
- The HTTP server embedded the refreshed page fragment using **Server-Side Includes (SSI)**.
- The page returned with the updated list of products.

#### Key Observations
- No **Dispatcher cache flushing** is required.
- Dynamic listings remain up-to-date without re-rendering pages on CMS publishers, reducing the load and cost of maintaining multiple publisher instances.

#### Key Takeaway/Value
- **No need to republish** the page with dynamic content.
- **No cache refresh** is needed; the HTTP server delivers the same homepage.
- SSI embeds the latest data when the page is requested by visitors.
- The same approach can deliver **personalized content**.

---

## Part II - Resources Based on Multiple Sources

### Presented Capabilities
- Always up-to-date, **auto-generated sitemaps** integrating multiple source systems (WebSight CMS, PIM).
- Real-time search serving instant information from source systems.

#### Orient the Audience to the Screen
1. Present the **sitemap.xml** file generated based on:
    - PIM data
    - CMS pages
2. Present the **search functionality**.

#### Scenario
1. **Unpublish product `B075X5TN2K`** (if not already done).
2. Open the Puresight homepage:
    - Search for **b075x5tn2k** → Show **no results**.
3. Open the **sitemap.xml** file:
    - Search for `b075x5tn2k` → Show **no results**.
4. Open the PIM and publish the product.
5. Repeat the search on the Puresight homepage for **b075x5tn2k** → Show the match.
6. Open **sitemap.xml** → Show the product match.
7. **Unpublish blog page** "Simplify Your Space: A Guide to Decluttering" from CMS.
    - Search for **"simplify-your-space"** in sitemap.xml → No results.
    - Search for **"simplify"** on the site → No results.
8. **Publish the blog page** again:
    - Show results in **sitemap.xml** and search.

#### Explain What Happened in the Background
- PIM informed StreamX about a **new product**.
- CMS informed StreamX about a **new page**.
- StreamX updated the **sitemap** and the **search functionality**.

#### Key Takeaway/Value
- **StreamX** ensures that delivery services always use **up-to-date information** from multiple systems.

---

## Part III - Multiple Sources Update the PDP

### Presented Capabilities
- Always up-to-date **Product Detail Page (PDP)** generated using data from multiple sources:
    - WebSight CMS
    - PIM
    - Price script
    - Reviews script

#### Orient the Audience to the Screen
- Present a PDP generated based on multiple sources

#### Scenario
1. Open the PDP from the homepage listing for product `B075X5TN2K`.
    - Explain which data comes from which system.
2. Update the price for `B075X5TN2K` → Refresh the PDP and show the updated price.
3. Add a review for `B075X5TN2K` → Refresh the PDP and show reviews.
4. Update the product name in PIM for `B075X5TN2K` → Show the updated name on the PDP.
5. Modify the PDP template in CMS → Refresh the PDP and show the updated content.

#### Explain What Happened in the Background
- PIM informed StreamX about a **product data change**.
- Scripts informed StreamX about **price and reviews changes**.
- CMS informed StreamX about a **PDP template content change**.
- StreamX updated the resulting PDP for every piece of information from different systems.

#### Key Takeaway/Value
- StreamX ensures that **resources remain up-to-date** regardless of which source triggers the data change.  
