<script>
	import '../app.css';

	import { onMount } from 'svelte';

	import { user } from '$lib/stores';

	import Navbar from '$lib/components/Navbar.svelte';
	import Auth from '$lib/components/Auth.svelte';
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
		class="flex flex-col min-h-screen w-full bg-primary text-primary-foreground font-main items-center justify-center"
	>
		<Auth />
	</main>
{:else}
	<main class="flex flex-col min-h-screen w-full bg-primary text-primary-foreground font-main">
		<section class="mx-auto min-w-[75%]">
			<Navbar />
			<div class="flex-grow bg-primary">
				<slot />
			</div>
		</section>
	</main>
{/if}
