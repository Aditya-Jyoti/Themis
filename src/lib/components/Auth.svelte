<script lang="ts">
	import { Input } from '$lib/components/ui/input/index.js';
	import { Label } from '$lib/components/ui/label/index.js';

	import { user } from '$lib/stores';

	import { supabase } from '$lib/supabase';

	import { slide } from 'svelte/transition';

	let type: string = 'Login';

	let name = '';
	let email = '';
	let password = '';

	const action = async () => {
		if (type === 'Login') {
			const { data, error } = await supabase.auth.signInWithPassword({
				email: email,
				password: password
			});

			if (!error) {
				const name_ = await supabase.from('User').select('name').eq('email', email).single();
				$user = { name: name_.data?.name, email: email };
			} else {
				console.error(error.message);
			}
		} else {
			const { data, error } = await supabase.auth.signUp({
				email: email,
				password: password
			});

			console.log(data);

			if (!error) {
				await supabase.from('User').insert({ name: name, email: email });

				$user = { name: name, email: email };
			} else {
				console.error(error.message);
			}
		}
	};
</script>

<section
	class="bg-primary text-primary-foreground md:w-[20%] w-[80%] items-center justify-center flex-col gap-4"
>
	<span class="text-2xl flex items-center justify-center w-full font-bold">{type}</span>
	<form on:submit={action} class="flex flex-col gap-4">
		{#if type !== 'Login'}
			<div transition:slide class="flex w-full max-w-sm flex-col gap-1.5">
				<Label for="name">Name</Label>
				<Input type="name" id="name" placeholder="Name" bind:value={name} class="hover:border-2" />
			</div>
		{/if}
		<div class="flex w-full max-w-sm flex-col gap-1.5">
			<Label for="email">Email</Label>
			<Input
				type="email"
				id="email"
				placeholder="Email"
				bind:value={email}
				class="hover:border-2"
			/>
		</div>
		<div class="flex w-full max-w-sm flex-col gap-1.5">
			<Label for="password">Password</Label>
			<Input
				type="password"
				id="password"
				placeholder="Password"
				bind:value={password}
				class="hover:border-2"
			/>
		</div>
		<button
			class="border-[1px] hover:bg-secondary hover:text-secondary-foreground transition-all duration-300 border-secondary w-full rounded-lg py-1"
			type="submit">submit</button
		>
	</form>
	<div class="font-semibold text-muted-foreground w-full flex items-center justify-between mt-2">
		<button
			on:click|preventDefault={() => {
				type = 'Login';
			}}
			class="hover:text-primary-foreground transition-all duration-150">login</button
		>
		<button
			on:click|preventDefault={() => {
				type = 'Signup';
			}}
			class="hover:text-primary-foreground transition-all duration-150">signup</button
		>
	</div>
</section>
