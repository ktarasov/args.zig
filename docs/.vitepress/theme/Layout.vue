<script setup lang="ts">
import DefaultTheme from "vitepress/theme";
import { useRoute } from "vitepress";
import { computed } from "vue";

const { Layout: DefaultLayout } = DefaultTheme;
const route = useRoute();

const breadcrumbs = computed(() => {
  const path = route.path.replace(/\/$/, "");
  if (!path || path === "/args.zig/" || path === "/args.zig") return [];

  const segments = path.replace(/^\/args\.zig\/?/, "").split("/").filter(Boolean);
  const items: { label: string; href: string }[] = [];
  let href = "/args.zig/";

  items.push({ label: "Home", href });

  let accumulated = "";
  segments.forEach((segment, i) => {
    accumulated += (accumulated ? "/" : "") + segment;
    href = `/args.zig/${accumulated}`;
    const label = segment
      .split("-")
      .map((s) => s.charAt(0).toUpperCase() + s.slice(1))
      .join(" ");
    items.push({ label, href: i === segments.length - 1 ? undefined : href });
  });

  return items;
});
</script>

<template>
  <DefaultLayout>
    <template #layout-top>
      <nav v-if="breadcrumbs.length > 1" class="vp-breadcrumbs" aria-label="Breadcrumb">
        <ol>
          <li v-for="(crumb, index) in breadcrumbs" :key="index" :class="{ active: !crumb.href }">
            <span v-if="!crumb.href">{{ crumb.label }}</span>
            <a v-else :href="crumb.href">{{ crumb.label }}</a>
            <span v-if="index < breadcrumbs.length - 1" class="separator" aria-hidden="true">/</span>
          </li>
        </ol>
      </nav>
    </template>
  </DefaultLayout>
</template>
