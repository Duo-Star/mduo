---
export const prerender = false;
import { Image } from 'astro:assets';
import Layout from "../layouts/Layout.astro";
import AppHeader from '../components/Header.astro';
import AppFooter from '../components/Footer.astro';

import '../styles/global.css';

// 1. 获取所有图片
const imageFiles = import.meta.glob('/src/assets/gallery/*.{jpeg,jpg,png,gif,webp}');

// 2. 解析图片数据
const rawImages = await Promise.all(
    Object.keys(imageFiles).map(async (path) => {
        const img = await imageFiles[path]() as any;
        return {
            path,
            data: img.default,
            name: path.split('/').pop()?.split('.').shift() || 'Untitled'
        };
    })
);

// 3. 获取当前页码
const url = new URL(Astro.request.url);
const page = parseInt(url.searchParams.get('page') || '1');
const pageSize = 9;

// 4. 逻辑：如果是第一页，随机选一张做置顶大图，并从列表中移除
// 注意：每次构建/刷新(SSR模式)时随机图可能变化
let heroImage = null;
let listImages = [...rawImages];

// 为了保持分页一致性，我们先排序（可选），然后取出随机图
// 这里简单起见，我们随机取一张，然后把它从数组里剔除，剩下的做分页
if (listImages.length > 0) {
    // 使用当天的日期或固定种子可以让它在SSG构建时稳定，或者完全随机
    const randomIndex = Math.floor(Math.random() * listImages.length);
    // 只有在第一页时，我们才把这张图拿出来当作 Hero，否则它就在后面的页码里
    // 但为了逻辑简单且不重复：我们在任何页码都把这张“今日推荐”提取出来，但只在第1页显示
    heroImage = listImages[randomIndex];
    listImages.splice(randomIndex, 1);
}

// 5. 计算分页
const totalPages = Math.ceil(listImages.length / pageSize);
const paginatedImages = listImages.slice((page - 1) * pageSize, page * pageSize);

// 生成页码数组 (简单的 [1, 2, 3] 逻辑，如果页码很多可能需要省略号逻辑)
const pageNumbers = Array.from({ length: totalPages }, (_, i) => i + 1);
---

<Layout>
    <AppHeader />

    <section class="py-20 min-h-screen bg-[var(--main-bg)] overflow-x-hidden">
        <div class="max-w-6xl mx-auto px-4">

            <div class="text-center mb-12">
                <h1 class="title text-5xl font-black">相册</h1>
                <p class="mt-4 text-gray-500 font-mono">CAPTURING MOMENTS / WITNESS BEAUTY</p>
            </div>

            {/* --- 🌟 第一页：随机置顶大图区域 --- */}
            {page === 1 && heroImage && (
                    <div class="mb-20 animate-fade-in-down">
                        <div class="relative bg-white border-4 border-black p-4 shadow-[12px_12px_0px_rgba(0,0,0,1)] transition-transform hover:-translate-y-1">

                            {/* 装饰性标签 */}
                            <div class="absolute -top-6 -left-2 bg-[var(--purple-m)] text-white font-black px-6 py-2 border-4 border-black transform -rotate-2 z-10 shadow-[4px_4px_0px_black]">
                                手 气 不 错
                            </div>

                            <div class="w-full h-[400px] md:h-[500px] overflow-hidden border-2 border-black relative group">
                                <Image
                                        src={heroImage.data}
                                        alt={heroImage.name}
                                        width={1200}
                                        height={800}
                                        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                                        loading="eager"
                                />
                                {/* 大图上的文字遮罩 */}
                                <div class="absolute bottom-0 left-0 w-full bg-black/70 p-4 text-white translate-y-full group-hover:translate-y-0 transition-transform duration-300">
                                    <h2 class="text-2xl font-bold font-mono">{heroImage.name}</h2>
                                </div>
                            </div>
                        </div>
                    </div>
            )}
            {/* --- 置顶结束 --- */}

            {/* 图片网格 */}
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                {paginatedImages.map((img, index) => (
                        <div
                                class="gallery-item group bg-white border-2 border-black p-3 transition-all duration-300 hover:shadow-[8px_8px_0px_rgba(0,0,0,1)] hover:-translate-y-1"
                                style={`animation-delay: ${index * 100}ms`}
                        >
                            <div class="relative w-full pb-[100%] overflow-hidden border-2 border-black mb-4 bg-gray-100">
                                <Image
                                        src={img.data}
                                        alt={img.name}
                                        width={600}
                                        height={600}
                                        class="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                                />
                            </div>
                            <div class="flex justify-between items-center border-t-2 border-black pt-2">
                                <span class="font-bold text-lg uppercase tracking-wider truncate pr-2">{img.name}</span>
                                <span class="text-xs font-mono text-gray-500">IMG_{index + 1}</span>
                            </div>
                        </div>
                ))}
            </div>

            {/* --- 📌 分页指示器 --- */}
            {totalPages > 1 && (
                    <div class="mt-20 flex flex-wrap justify-center items-center gap-3">
                        {/* 上一页 */}
                        {page > 1 ? (
                                <a href={`?page=${page - 1}`} class="pagination-btn bg-white">
                                    &lt; PREV
                                </a>
                        ) : (
                                <span class="pagination-btn opacity-50 cursor-not-allowed bg-gray-200">
                            &lt; PREV
                        </span>
                        )}

                        {/* 页码数字 */}
                        {pageNumbers.map((p) => (
                                <a
                                        href={`?page=${p}`}
                                        class={`pagination-btn w-12 flex justify-center ${p === page ? 'bg-black text-white hover:bg-gray-800' : 'bg-white '}`}
                                >
                                    {p}
                                </a>
                        ))}

                        {/* 下一页 */}
                        {page < totalPages ? (
                                <a href={`?page=${page + 1}`} class="pagination-btn bg-white">
                                    NEXT &gt;
                                </a>
                        ) : (
                                <span class="pagination-btn opacity-50 cursor-not-allowed bg-gray-200">
                            NEXT &gt;
                        </span>
                        )}
                    </div>
            )}

            {/* 分页信息文本 */}
            <div class="text-center mt-6 text-sm font-mono text-gray-500">
                PAGE {page} OF {totalPages}
            </div>

        </div>
    </section>

    <AppFooter />
</Layout>

<style is:global>
    /*
       定义基本动画，不使用 Tailwind 的 @apply 以避免报错。
       所有的样式都尽可能写在 HTML class 中。
    */

    .gallery-item {
        opacity: 0;
        animation: galleryFadeIn 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    .animate-fade-in-down {
        animation: galleryFadeIn 1s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    @keyframes galleryFadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* 分页按钮通用样式 */
    .pagination-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center; /* 确保文字居中 */
        height: 3rem; /* h-12 */
        padding-left: 1rem; /* px-4 */
        padding-right: 1rem;
        border-width: 2px; /* border-2 */
        border-color: black;
        font-weight: 900; /* font-black */
        font-family: monospace;
        transition: all 0.2s;
        box-shadow: 4px 4px 0px rgba(0,0,0,1);
    }

    .pagination-btn:hover:not(.cursor-not-allowed) {
        transform: translateY(-2px);
        box-shadow: 6px 6px 0px rgba(0,0,0,1);
    }

    .pagination-btn:active:not(.cursor-not-allowed) {
        transform: translateY(0);
        box-shadow: 2px 2px 0px rgba(0,0,0,1);
    }
</style>