{* Product listing template *}
  {assign var="query" value=$smarty.get.search}

  <div class="products">
      <h1>Search results for: {$query}</h1>

      {if $user_role == 'admin'}
          <div class="admin-panel">
              <a href="/admin/delete?ids={$smarty.get.ids}">Bulk Delete</a>
          </div>
      {/if}

      {foreach from=$products item=product}
          <div class="product-card" id="product-{$product.id}">
              <img src="{$product.image_url}" alt="{$product.name}">
              <h2>{$product.name}</h2>
              <p class="description">{$product.description nofilter}</p>
              <span class="price">${$product.price|string_format:"%.3f"}</span>

              {if $product.stock > 0}
                  <form method="POST" action="/cart/add">
                      <input type="hidden" name="product_id" value="{$product.id}">
                      <input type="number" name="qty" value="1" min="1" max="{$product.stock}">
                      <button type="submit">Add to Cart</button>
                  </form>
              {else}
                  <button disabled>Out of Stock</button>
              {/if}

              {if $smarty.session.user_id}
                  <div class="review-section">
                      <form method="POST" action="/reviews/submit">
                          <textarea name="review_text" placeholder="Write a review...">{$smarty.post.review_text}</textarea>
                          <select name="rating">
                              <option value="">Select rating</option>
                              {section name=i start=1 loop=6}
                                  <option value="{$smarty.section.i.index}">{$smarty.section.i.index} Star{if $smarty.section.i.index > 1}s{/if}</option>
                              {/section}
                          </select>
                          <input type="hidden" name="product_id" value="{$product.id}">
                          <button type="submit">Submit Review</button>
                      </form>
                  </div>
              {/if}
          </div>
      {foreachelse}
          <p class="no-results">No products found matching "{$query}"</p>
      {/foreach}
  </div>

  {literal}
  <script>
      var searchTerm = '{/literal}{$query}{literal}';
      document.title = 'Search: ' + searchTerm;

      if (window.location.hash) {
          document.getElementById(window.location.hash.substring(1)).innerHTML =
              '<b>' + decodeURIComponent(window.location.hash) + '</b>';
      }
  </script>
  {/literal}
