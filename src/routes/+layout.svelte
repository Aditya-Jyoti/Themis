<script>
	import '../app.css';

	import { onMount } from 'svelte';
	import { slide } from 'svelte/transition';

	import { user } from '$lib/stores';

	import Navbar from '$lib/components/Navbar.svelte';
	import Auth from '$lib/components/Auth.svelte';
	import Footer from '$lib/components/Footer.svelte';

	import { supabase } from '$lib/supabase';

	onMount(async () => {
		const { data } = await supabase.auth.getUser();

		if (data.user) {
			let user_data = await supabase.from('User').select().eq('email', data.user.email).single();
			$user = { name: user_data.data.name, email: user_data.data.email };
		}
	});
</script>

{#if $user === null}
	<main
		transition:slide
		class="flex flex-col min-h-screen w-full bg-primary text-primary-foreground font-main items-center justify-center"
	>
		<Auth />
	</main>
{:else}
	<main
		transition:slide
		class="flex flex-col min-h-screen w-full bg-primary text-primary-foreground font-main"
	>
		<section class="flex flex-col mx-auto min-w-[75%] flex-grow">
			<Navbar />
			<div class="flex-grow">
				<slot />
			</div>
			<Footer />
		</section>
	</main>
{/if}
