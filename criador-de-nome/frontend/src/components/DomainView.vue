<template>
	<div>
		<div class="container">
			<router-link to="/domains">Voltar</router-link>
			<br/>
			<br/>
			<div><h2>{{ domain }}</h2></div>
			<br/>
			<div class="card">
				<div class="card-body">
					<ul class="list-group">
						<li class="list-group-item" v-for="domain in domains" v-bind:key="domain.extension">
							<div class="row">
								<div class="col-md-6">{{ domain.extension }}</div>
								<div class="col-md-3"><span v-bind:class="domain.classes">{{ domain.available }}</span></div>
								<div class="col-md-3 text-right">
									<a class="btn btn-info" v-bind:href="domain.checkout" target="_blank"><span class="fa fa-shopping-cart"></span></a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import axios from "axios/dist/axios";

export default {
	props: ["domain"],
	data() {
		return{
			domains: []
		};
	},
	created(){
		axios({
			url:"http://localhost:4000",
			method: "post",
			data: {
				query: `
					mutation ($name: String){
						domain: generateDomain(name: $name){
							name
							checkout
							available
							extension
						}
					}
				`,
				variables:{
					name: this.domain
				}
			}
		}).then(response => {
			const query = response.data;
			this.domains = query.data.domain.map(domain => {
				return {
					name: domain.name,
					checkout: domain.checkout,
					extension: domain.extension,
					available: (domain.available) ? "Disponível" : "Indisponível",
					classes: (domain.available) ? "badge badge-success" : "badge badge-secondary"
				};
			});
		});
	}
};
</script>