
import { defineCollection, z } from 'astro:content';

const projectsCollection = defineCollection({
  schema: z.object({
    title: z.string(),
    tech: z.array(z.string()),
  }),
});

export const collections = {
  'projects': projectsCollection,
};
