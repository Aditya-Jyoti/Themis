<script lang="ts">
	import { user } from '$lib/stores';
	import { supabase } from '$lib/supabase';
</script>

<nav
	class="bg-primary w-full mx-4 py-2 flex justify-between items-center border-b-[1px] border-muted-foreground border-opacity-50"
>
	<div class="flex items-center gap-2">
		<img src="/icon.png" alt="icon" class="w-14 h-14" />
		<span class="text-primary-foreground text-2xl font-semibold tracking-widest">Themis</span>
	</div>
	<div class="flex items-center gap-2">
		{#if $user === null}
			<span class="text-2xl font-semibold">Hello User!</span>
		{:else}
			<span class="text-2xl font-semibold">Hello {$user.name}!</span>
		{/if}
		<button
			class="text-lg"
			on:click|preventDefault={async () => {
				$user = null;
				await supabase.auth.signOut();
			}}>logout?</button
		>
	</div>
</nav>
